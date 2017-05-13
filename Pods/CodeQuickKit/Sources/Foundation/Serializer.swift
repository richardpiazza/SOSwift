//===----------------------------------------------------------------------===//
//
// Serializer.swift
//
// Copyright (c) 2016 Richard Piazza
// https://github.com/richardpiazza/CodeQuickKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//===----------------------------------------------------------------------===//

import Foundation

/// Casing styles for `Serializable` object properties. (Default .MatchCase)
public enum SerializerKeyStyle {
    case matchCase
    case titleCase
    case camelCase
    case upperCase
    case lowerCase
}

/// Redirects that should be applied to all objects during the de/serialization process.
public typealias SerializerRedirect = (propertyName: String, serializedKey: String)

/// A collection of methods and properties the aid in the de/serializtion process.
public class Serializer {
    public static var propertyKeyStyle: SerializerKeyStyle = .matchCase
    public static var serializedKeyStyle: SerializerKeyStyle = .matchCase
    public static var dateFormatter: DateFormatter = DateFormatter.rfc1123DateFormatter
    public static var keyRedirects: [SerializerRedirect] = [SerializerRedirect]()
    
    /// Returns the properly cased property name for the given serialized key.
    public static func propertyName(forSerializedKey serializedKey: String) -> String? {
        for (p, s) in keyRedirects {
            if s == serializedKey {
                return p
            }
        }
        
        return serializedKey.applyingKeyStyle(propertyKeyStyle)
    }
    
    /// Returns the properly cased serialized key for the given property name.
    public static func serializedKey(forPropertyName propertyName: String) -> String? {
        for (p, s) in keyRedirects {
            if p == propertyName {
                return s
            }
        }
        
        return propertyName.applyingKeyStyle(serializedKeyStyle)
    }
    
    /// Transforms common JSON string values into corresponding `NSObject`'s
    public static func initializedObject(forPropertyName propertyName: String, ofClass: AnyClass, withData data: NSObject?) -> NSObject? {
        guard let d = data else {
            return nil
        }
        
        if let s = d as? String {
            let propertyClass: AnyClass = objectClass(forPropertyName: propertyName, ofClass: ofClass)
            
            switch propertyClass {
            case is UUID.Type:
                return UUID(uuidString: s) as NSObject?
            case is NSUUID.Type:
                return UUID(uuidString: s) as NSObject?
            case is Date.Type:
                return dateFormatter.date(from: s) as NSObject?
            case is NSDate.Type:
                return dateFormatter.date(from: s) as NSObject?
            case is URL.Type:
                return URL(string: s) as NSObject?
            case is NSURL.Type:
                return URL(string: s) as NSObject?
            default: break
            }
        }
        
        return d
    }
    
    /// Transforms `NSObject`'s not handled by NSJSONSerialization into string serializable values.
    public static func serializedObject(forPropertyName propertyName: String, withData data: NSObject?) -> NSObject? {
        guard let d = data else {
            return nil
        }
        
        if let uuid = d as? UUID {
            return uuid.uuidString as NSObject?
        } else if let date = d as? Date {
            return dateFormatter.string(from: date) as NSObject?
        } else if let url = d as? URL {
            return url.absoluteString as NSObject?
        }
        
        return d
    }
    
    /// Lists all property names for an object of the provided class.
    public static func propertyNames(forClass objectClass: AnyClass) -> [String] {
        var properties: [String] = [String]()
        
        if let sc = objectClass.superclass() , (sc != SerializableObject.self && sc != NSObject.self) {
            properties.append(contentsOf: self.propertyNames(forClass: sc))
        }
        
        var propertyListCount: CUnsignedInt = 0
        let runtimeProperties = class_copyPropertyList(objectClass, &propertyListCount)
        
        for index in 0..<Int(propertyListCount) {
            let runtimeProperty = runtimeProperties?[index]
            let runtimeName = property_getName(runtimeProperty)
            let propertyName = NSString(utf8String: runtimeName!)
            guard var property = propertyName else {
                continue
            }
            if property.hasPrefix("Optional") {
                property = property.substring(with: NSMakeRange(8, property.length - 1)) as NSString
            }
            let propertyString = String(property)
            if !properties.contains(propertyString) {
                properties.append(propertyString)
            }
        }
        
        free(runtimeProperties)
        
        return properties
    }
    
    /// Provides the class for a property with the given name.
    /// Will return NSNull class if property name not found/valid or not an NSObject subclass.
    public static func objectClass(forPropertyName propertyName: String, ofClass objectClass: AnyClass) -> AnyClass {
        let runtimeProperty = class_getProperty(objectClass, (propertyName as NSString).utf8String)
        guard runtimeProperty != nil else {
            return NSNull.self
        }
        
        let runtimeAttributes = property_getAttributes(runtimeProperty)
        let propertyAttributesString = NSString(utf8String: runtimeAttributes!)
        let propertyAttributesCollection = propertyAttributesString?.components(separatedBy: ",")
        guard let attributesCollection = propertyAttributesCollection , attributesCollection.count > 0 else {
            return NSNull.self
        }
        
        let propertyClassAttribute = attributesCollection[0]
        if (propertyClassAttribute as NSString).length == 2 {
            let type = (propertyClassAttribute as NSString).substring(from: 1)
            switch type {
            case "q":
                // Swift Int
                return NSNumber.self
            case "d":
                // Swift Double
                return NSNumber.self
            case "f":
                // Swift Float
                return NSNumber.self
            case "B":
                // Swift Bool
                return NSNumber.self
            case "@":
                return NSObject.self
            default:
                return NSObject.self
            }
        }
        
        let propertyClass = (propertyClassAttribute as NSString).substring(from: 1)
        let className = (propertyClass as NSString).substring(with: NSMakeRange(2, (propertyClass as NSString).length - 3))
        guard let anyclass = NSClassFromString(className) else {
            return NSNull.self
        }
        
        return anyclass.self
    }
}

public extension String {
    public var removingPrettyJSONFormatting: String {
        var mutated = self
        mutated = mutated.replacingOccurrences(of: "\n", with: "")
        mutated = mutated.replacingOccurrences(of: " : ", with: ":")
        mutated = mutated.replacingOccurrences(of: "  ", with: "")
        mutated = mutated.replacingOccurrences(of: "\\/", with: "/")
        return mutated
    }
    
    internal func applyingKeyStyle(_ keyStyle: SerializerKeyStyle) -> String {
        guard self.lengthOfBytes(using: .utf8) <= 1 else {
            return self
        }
        
        switch keyStyle {
        case .titleCase:
            let range = self.startIndex..<self.characters.index(self.startIndex, offsetBy: 1)
            let sub = self.substring(with: range).uppercased()
            return self.replacingCharacters(in: range, with: sub)
        case .camelCase:
            let range = self.startIndex..<self.characters.index(self.startIndex, offsetBy: 1)
            let sub = self.substring(with: range).lowercased()
            return self.replacingCharacters(in: range, with: sub)
        case .upperCase:
            return self.uppercased()
        case .lowerCase:
            return self.lowercased()
        default:
            return self
        }
    }
}
