import Foundation

// Inspiration:
// * https://gist.github.com/mbuchetics/c9bc6c22033014aa0c550d3b4324411a
// * https://gist.github.com/loudmouth/332e8d89d8de2c1eaf81875cfcd22e24
// * https://stackoverflow.com/questions/47575309/how-to-encode-a-property-with-type-of-json-dictionary-in-swift-4-encodable-proto

public struct JSONCodingKeys: CodingKey {
    public var stringValue: String
    
    public init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public var intValue: Int?
    
    public init(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }
}


public extension KeyedDecodingContainerProtocol {
    func decode(_ type: Dictionary<String, Any>.Type, forKey key: Key) throws -> Dictionary<String, Any> {
        let container = try self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        return try container.decode(type)
    }
    
    func decodeIfPresent(_ type: Dictionary<String, Any>.Type, forKey key: Key) throws -> Dictionary<String, Any>? {
        guard contains(key) else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    
    func decode(_ type: Array<Any>.Type, forKey key: Key) throws -> Array<Any> {
        var container = try self.nestedUnkeyedContainer(forKey: key)
        return try container.decode(type)
    }
    
    func decodeIfPresent(_ type: Array<Any>.Type, forKey key: Key) throws -> Array<Any>? {
        guard contains(key) else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    
    func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        var dictionary = Dictionary<String, Any>()
        
        for key in allKeys {
            if let intValue = try? decode(Int.self, forKey: key) {
                dictionary[key.stringValue] = intValue
            } else if let stringValue = try? decode(String.self, forKey: key) {
                dictionary[key.stringValue] = stringValue
            } else if let boolValue = try? decode(Bool.self, forKey: key) {
                dictionary[key.stringValue] = boolValue
            } else if let doubleValue = try? decode(Double.self, forKey: key) {
                dictionary[key.stringValue] = doubleValue
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self, forKey: key) {
                dictionary[key.stringValue] = nestedDictionary
            } else if let nestedArray = try? decode(Array<Any>.self, forKey: key) {
                dictionary[key.stringValue] = nestedArray
            } else if try decodeNil(forKey: key) {
                dictionary[key.stringValue] = true
            }
        }
        return dictionary
    }
}

public extension KeyedEncodingContainerProtocol {
    mutating func encode(_ value: Dictionary<String, Any>, forKey key: Key) throws {
        var container = nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        try container.encode(value)
    }
    
    mutating func encodeIfPresent(_ value: Dictionary<String, Any>?, forKey key: Key) throws {
        guard let value = value else {
            return
        }
        
        try encode(value, forKey: key)
    }
    
    mutating func encode(_ value: Array<Any>, forKey key: Key) throws {
        var container = nestedUnkeyedContainer(forKey: key)
        try container.encode(value)
    }
    
    mutating func encodeIfPresent(_ value: Array<Any>?, forKey key: Key) throws {
        guard let value = value else {
            return
        }
        
        try encode(value, forKey: key)
    }
}

public extension KeyedEncodingContainerProtocol where Key == JSONCodingKeys {
    mutating func encode(_ value: Dictionary<String, Any>) throws {
        for (index, element) in value {
            let key = JSONCodingKeys(stringValue: index)
            
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
            case Optional<Any>.none:
                try encodeNil(forKey: key)
            default:
                let context = EncodingError.Context(codingPath: [key], debugDescription: "Invalid Decoding Value")
                throw EncodingError.invalidValue(element, context)
            }
        }
    }
}

public extension UnkeyedDecodingContainer {
    /// Decode an array of primintive types
    mutating func decode(_ type: Array<Any>.Type) throws -> Array<Any> {
        var array: [Any] = []
        while isAtEnd == false {
            if let value = try? decode(Bool.self) {
                array.append(value)
            } else if let value = try? decode(Double.self) {
                array.append(value)
            } else if let value = try? decode(String.self) {
                array.append(value)
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self) {
                array.append(nestedDictionary)
            } else if let nestedArray = try? decode(Array<Any>.self) {
                array.append(nestedArray)
            }
        }
        return array
    }
    
    /// Decode a dictionary supporting primitive types
    mutating func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        let nestedContainer = try self.nestedContainer(keyedBy: JSONCodingKeys.self)
        return try nestedContainer.decode(type)
    }
}

public extension UnkeyedEncodingContainer {
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
            case let primitive as Array<Any>:
                try encode(primitive)
            case Optional<Any>.none:
                try encodeNil()
            default:
                let context = EncodingError.Context(codingPath: [JSONCodingKeys(intValue: index)], debugDescription: "Invalid Encoding Value")
                throw EncodingError.invalidValue(element, context)
            }
        }
    }
    
    mutating func encode(_ value: Dictionary<String, Any>) throws {
        var container = nestedContainer(keyedBy: JSONCodingKeys.self)
        try container.encode(value)
    }
}
