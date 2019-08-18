import Foundation

/// A struct used to support `Dictionary` _(`[String:Any]`)_ and `Array` _(`[Any]`)_
/// encoding and decoding.
///
/// Both _Keyed_ and _Unkeyed_ containers are supported. Keep in mind that 'Any', must be
/// a primitive type that is supported with JSON:
///
/// * `Bool`
/// * `Int`
/// * `Double`
/// * `String`
/// * `Dictionary<String, Any>`
/// * `Array<Any>`
///
/// ## Inspiration
/// * [https://gist.github.com/mbuchetics/c9bc6c22033014aa0c550d3b4324411a](https://gist.github.com/mbuchetics/c9bc6c22033014aa0c550d3b4324411a)
/// * [https://gist.github.com/loudmouth/332e8d89d8de2c1eaf81875cfcd22e24](https://gist.github.com/loudmouth/332e8d89d8de2c1eaf81875cfcd22e24)
/// * [https://stackoverflow.com/questions/47575309/how-to-encode-a-property-with-type-of-json-dictionary-in-swift-4-encodable-proto](https://stackoverflow.com/questions/47575309/how-to-encode-a-property-with-type-of-json-dictionary-in-swift-4-encodable-proto)
public struct DictionaryKeys: CodingKey {
    public var stringValue: String
    public var intValue: Int?
    
    public init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public init(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
}

public extension KeyedDecodingContainerProtocol {
    /// Decodes a value of the given type for the given key.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - returns: A value of the requested type, if present for the given key
    ///   and convertible to the requested type.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    func decode(_ type: Dictionary<String, Any>.Type, forKey key: Key) throws -> Dictionary<String, Any> {
        let container = try self.nestedContainer(keyedBy: DictionaryKeys.self, forKey: key)
        return try container.decode(type)
    }
    
    /// Decodes a value of the given type for the given key.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - returns: A value of the requested type, if present for the given key
    ///   and convertible to the requested type.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    func decode(_ type: Array<Any>.Type, forKey key: Key) throws -> Array<Any> {
        var container = try self.nestedUnkeyedContainer(forKey: key)
        return try container.decode(type)
    }
    
    /// Decodes a value of the given type for the given key, if present.
    ///
    /// This method returns `nil` if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - returns: A decoded value of the requested type, or `nil` if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Dictionary<String, Any>.Type, forKey key: Key) throws -> Dictionary<String, Any>? {
        guard contains(key) else {
            return nil
        }
        
        return try decode(type, forKey: key)
    }
    
    /// Decodes a value of the given type for the given key, if present.
    ///
    /// This method returns `nil` if the container does not have a value
    /// associated with `key`, or if the value is null. The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter type: The type of value to decode.
    /// - parameter key: The key that the decoded value is associated with.
    /// - returns: A decoded value of the requested type, or `nil` if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent(_ type: Array<Any>.Type, forKey key: Key) throws -> Array<Any>? {
        guard contains(key) else {
            return nil
        }
        
        return try decode(type, forKey: key)
    }
}

public extension KeyedDecodingContainerProtocol where Key == DictionaryKeys {
    /// Decodes a value of the given type for the given key.
    ///
    /// - parameter type: The type of value to decode.
    /// - returns: A value of the requested type, if present for the given key
    ///   and convertible to the requested type.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        var dictionary: [String: Any] = [:]
        
        for key in allKeys {
            if let boolValue = try? decode(Bool.self, forKey: key) {
                dictionary[key.stringValue] = boolValue
                
            } else if let intValue = try? decode(Int.self, forKey: key) {
                dictionary[key.stringValue] = intValue
                
            } else if let doubleValue = try? decode(Double.self, forKey: key) {
                dictionary[key.stringValue] = doubleValue
                
            } else if let stringValue = try? decode(String.self, forKey: key) {
                dictionary[key.stringValue] = stringValue
                
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self, forKey: key) {
                dictionary[key.stringValue] = nestedDictionary
                
            } else if let nestedArray = try? decode(Array<Any>.self, forKey: key) {
                dictionary[key.stringValue] = nestedArray
                
            } else if try decodeNil(forKey: key) {
                dictionary[key.stringValue] = NSNull()
            } else {
                let context = DecodingError.Context(codingPath: [key], debugDescription: "Invalid Decoding Value")
                throw DecodingError.typeMismatch(type, context)
            }
        }
        
        return dictionary
    }
}

public extension UnkeyedDecodingContainer {
    /// Decodes a value of the given type.
    ///
    /// - parameter type: The type of value to decode.
    /// - returns: A value of the requested type, if present for the given key
    ///   and convertible to the requested type.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        let container = try nestedContainer(keyedBy: DictionaryKeys.self)
        return try container.decode(type)
    }
    
    /// Decodes a value of the given type.
    ///
    /// - parameter type: The type of value to decode.
    /// - returns: A value of the requested type, if present for the given key
    ///   and convertible to the requested type.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    mutating func decode(_ type: Array<Any>.Type) throws -> Array<Any> {
        var array: [Any] = []
        
        while isAtEnd == false {
            if let value = try? decode(Bool.self) {
                array.append(value)
            } else if let value = try? decode(Int.self) {
                array.append(value)
            } else if let value = try? decode(Double.self) {
                array.append(value)
            } else if let value = try? decode(String.self) {
                array.append(value)
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self) {
                array.append(nestedDictionary)
            } else if let nestedArray = try? decode(Array<Bool>.self) {
                array.append(nestedArray)
            } else if let nestedArray = try? decode(Array<Int>.self) {
                array.append(nestedArray)
            } else if let nestedArray = try? decode(Array<Double>.self) {
                array.append(nestedArray)
            } else if let nestedArray = try? decode(Array<String>.self) {
                array.append(nestedArray)
            } else if let nestedArray = try? decode(Array<Any>.self) {
                array.append(nestedArray)
            } else if let _ = try? decodeNil() {
                array.append(NSNull())
            } else {
                let context = DecodingError.Context(codingPath: [DictionaryKeys(intValue: currentIndex)], debugDescription: "Invalid Decoding Value")
                throw DecodingError.typeMismatch(type, context)
            }
        }
        
        return array
    }
}

public extension KeyedEncodingContainerProtocol {
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Dictionary<String, Any>, forKey key: Key) throws {
        var container = nestedContainer(keyedBy: DictionaryKeys.self, forKey: key)
        try container.encode(value)
    }
    
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Array<Any>, forKey key: Key) throws {
        var container = nestedUnkeyedContainer(forKey: key)
        try container.encode(value)
    }
    
    /// Encodes the given value for the given key if it is not `nil`.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Dictionary<String, Any>?, forKey key: Key) throws {
        guard let value = value else {
            return
        }
        
        try encode(value, forKey: key)
    }
    
    /// Encodes the given value for the given key if it is not `nil`.
    ///
    /// - parameter value: The value to encode.
    /// - parameter key: The key to associate the value with.
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encodeIfPresent(_ value: Array<Any>?, forKey key: Key) throws {
        guard let value = value else {
            return
        }
        
        try encode(value, forKey: key)
    }
}

public extension KeyedEncodingContainerProtocol where Key == DictionaryKeys {
    /// Encodes the given value for the given key.
    ///
    /// - parameter value: The value to encode.
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Dictionary<String, Any>) throws {
        for (index, element) in value {
            let key = DictionaryKeys(stringValue: index)
            
            switch element {
            case let primitive as Bool:
                try encode(primitive, forKey: key)
            case let primitive as Int:
                try encode(primitive, forKey: key)
            case let primitive as Double:
                try encode(primitive, forKey: key)
            case let primitive as String:
                try encode(primitive, forKey: key)
            case let primitive as Dictionary<String, Any>:
                try encode(primitive, forKey: key)
            case let primitive as Array<Any>:
                try encode(primitive, forKey: key)
            case is NSNull:
                try encodeNil(forKey: key)
            default:
                let context = EncodingError.Context(codingPath: [key], debugDescription: "Invalid Encoding Value")
                throw EncodingError.invalidValue(element, context)
            }
        }
    }
}

public extension UnkeyedEncodingContainer {
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Dictionary<String, Any>) throws {
        var container = nestedContainer(keyedBy: DictionaryKeys.self)
        try container.encode(value)
    }
    
    /// Encodes the given value.
    ///
    /// - parameter value: The value to encode.
    /// - throws: `EncodingError.invalidValue` if the given value is invalid in
    ///   the current context for this format.
    mutating func encode(_ value: Array<Any>) throws {
        for (index, element) in value.enumerated() {
            switch element {
            case let primitive as Bool:
                try encode(primitive)
            case let primitive as Int:
                try encode(primitive)
            case let primitive as Double:
                try encode(primitive)
            case let primitive as String:
                try encode(primitive)
            case let primitive as Dictionary<String, Any>:
                try encode(primitive)
            case let primitive as Array<Bool>:
                try encode(primitive)
            case let primitive as Array<Int>:
                try encode(primitive)
            case let primitive as Array<Double>:
                try encode(primitive)
            case let primitive as Array<String>:
                try encode(primitive)
            case let primitive as Array<Any>:
                try encode(primitive)
            case is NSNull:
                try encodeNil()
            default:
                let context = EncodingError.Context(codingPath: [DictionaryKeys(intValue: index)], debugDescription: "Invalid Encoding Value")
                throw EncodingError.invalidValue(element, context)
            }
        }
    }
}
