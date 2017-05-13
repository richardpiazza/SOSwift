//===----------------------------------------------------------------------===//
//
// Serializable.swift
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

public typealias SerializableDictionary = [String : NSObject]

/// A protocol specifying methods for interacting with Dictionary/JSON representations of NSObjects.
public protocol Serializable: NSObjectProtocol {
    /// Called imediatley after initialization, allowing for property initialization.
    func setDefaults()
    
    /// Initialize an instance of the class and pass the referenced dictionary to updateWithDictionary:.
    init(withDictionary dictionary: SerializableDictionary?)
    /// Updates the instance with values in the dictionary.
    func update(withDictionary dictionary: SerializableDictionary?)
    /// Returns a dictionary representation of the instance.
    var dictionary: SerializableDictionary { get }
    
    /// Initialize an instance of the class and pass the referenced data to updateWithData:.
    init(withData data: Data?)
    /// Passes the NSData instance of NSDictionary to updateWithDictionary:.
    func update(withData data: Data?)
    /// Returns the dictionary representation of the instance as an NSData object.
    var data: Data? { get }
    
    /// Initialize an instance of the class and pass the referenced json to updateWithJSON:.
    init(withJSON json: String?)
    /// Deserialize the JSON formatted string and pass the NSDictionary to updateWithDictionary:.
    func update(withJSON json: String?)
    /// Returns the dictionary representation of the instance as a JSON formatted string.
    var json: String? { get }
    
    /// Maps a serialized key to a property name.
    /// Case translation is automatic based on `Serializer.propertyKeyStyle`.
    /// A nil return will skip the deserialization for this key.
    func propertyName(forSerializedKey serializedKey: String) -> String?
    
    /// Maps a propety name to serialized key.
    /// Case translation is automatic based on `Serializer.serializedKeyStyle`.
    /// A nil return will skip the deserialization for this key.
    ///
    /// When used in the context of `SerializableManagedObject` subclasses, a nil blocks recursive serialization.
    /// i.e. Given Person -> Address (One-to-many with reverse reference); When serializing a 'Person',
    /// you want the related Addresses but don't want the 'Person' referenced on the 'Address'.
    func serializedKey(forPropertyName propertyName: String) -> String?
    
    /// Overrides the default initialization behavior for a given property.
    /// Many serialized object types can be nativly deserialized to their corresponding `NSObject` type.
    /// Objects that conform to `Serializable` will automatically by initialized.
    ///
    /// When used in the context of `SerializableManagedObject`, `init(intoManagedObjectContext:withDictionary:)`
    /// is called.
    func initializedObject(forPropertyName propertyName: String, withData data: NSObject) -> NSObject?
    
    /// Overrides the default serialization behavior for a given property.
    /// Several NSObject subclasses can nativley be serialized with the NSJSONSerialization class.
    /// When used in the context of `Serializable` the `dictionary` representation is returned.
    func serializedObject(forPropertyName propertyname: String, withData data: NSObject) -> NSObject?
    
    /// Specifyes the type of objects contained within a collection.
    /// Aids in deserializing array instances into appropriate `NSObject` subclasses.
    /// By default a singularized version of the provided propertyName will be used to
    /// identify the return class.
    func objectClassOfCollectionType(forPropertyname propertyName: String) -> AnyClass?
}
