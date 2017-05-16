import Foundation

/// PropertyValue, Text, URL
public protocol Identifier {}

public extension Identifier {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? PropertyValue {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: Identifier {}

extension URL: Identifier {}
