import Foundation
import SOSwiftVocabulary

public enum SOValueReference: ValueReference, Codable {
    case enumeration(value: SOEnumeration)
    case propertyValue(value: SOPropertyValue)
    case qualitativeValue(value: SOQualitativeValue)
    case quantitativeValue(value: SOQuantitativeValue)
    case structuredValue(value: SOStructuredValue)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOEnumeration.type:
            let value = try container.decode(SOEnumeration.self)
            self = .enumeration(value: value)
        case SOPropertyValue.type:
            let value = try container.decode(SOPropertyValue.self)
            self = .propertyValue(value: value)
        case SOQualitativeValue.type:
            let value = try container.decode(SOQualitativeValue.self)
            self = .qualitativeValue(value: value)
        case SOQuantitativeValue.type:
            let value = try container.decode(SOQuantitativeValue.self)
            self = .quantitativeValue(value: value)
        case SOStructuredValue.type:
            let value = try container.decode(SOStructuredValue.self)
            self = .structuredValue(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .enumeration(let value):
            try container.encode(value)
        case .propertyValue(let value):
            try container.encode(value)
        case .qualitativeValue(let value):
            try container.encode(value)
        case .quantitativeValue(let value):
            try container.encode(value)
        case .structuredValue(let value):
            try container.encode(value)
        }
    }
    
    public var enumeration: SOEnumeration? {
        switch self {
        case .enumeration(let value):
            return value
        default:
            return nil
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
    
    public var qualitativeValue: SOQualitativeValue? {
        switch self {
        case .qualitativeValue(let value):
            return value
        default:
            return nil
        }
    }
    
    public var quantitativeValue: SOQuantitativeValue? {
        switch self {
        case .quantitativeValue(let value):
            return value
        default:
            return nil
        }
    }
    
    public var structuredValue: SOStructuredValue? {
        switch self {
        case .structuredValue(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ValueReference?, forKey key: K) throws {
        if let typedValue = value as? SOEnumeration {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOStructuredValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeValueReferenceIfPresent(forKey key: K) throws -> ValueReference? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOEnumeration.type {
                return try self.decode(SOEnumeration.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOStructuredValue.type {
                return try self.decode(SOStructuredValue.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `Value` for key: \(key.stringValue).")
        
        return nil
    }
}
