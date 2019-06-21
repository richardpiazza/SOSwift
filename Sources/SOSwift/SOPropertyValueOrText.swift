import Foundation
import SOSwiftVocabulary

public enum SOPropertyValueOrText: PropertyValueOrText, Codable {
    case propertyValue(value: SOPropertyValue)
    case text(value: String)
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            self = .text(value: value)
            return
        }
        
        guard let type = jsonDictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOPropertyValue.type:
            let value = try container.decode(SOPropertyValue.self)
            self = .propertyValue(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .propertyValue(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var propertyValue: SOPropertyValue? {
        switch self {
        case .propertyValue(let value):
            return value
        default:
            return nil
        }
    }
    
    public var text: String? {
        switch self {
        case .text(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: PropertyValueOrText?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOPropertyValueOrText {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPropertyValue {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [PropertyValueOrText]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? [SOPropertyValueOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value.forEach { (object) in
            if let typedValue = object as? SOPropertyValue {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        }
    }
}

public extension KeyedDecodingContainer {
    func decodePropertyValueOrTextIfPresent(forKey key: K) throws -> PropertyValueOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOPropertyValueOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodePropertyValuesOrTextsIfPresent(forKey key: K) throws -> [PropertyValueOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOPropertyValueOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
