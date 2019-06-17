import Foundation
import SOSwiftVocabulary

public enum SODistanceOrQuantitativeValue: DistanceOrQuantitativeValue, Codable {
    case distance(value: SODistance)
    case quantitativeValue(value: SOQuantitativeValue)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SODistance.type:
            let value = try container.decode(SODistance.self)
            self = .distance(value: value)
        case SOQuantitativeValue.type:
            let value = try container.decode(SOQuantitativeValue.self)
            self = .quantitativeValue(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .distance(let value):
            try container.encode(value)
        case .quantitativeValue(let value):
            try container.encode(value)
        }
    }
    
    public var distance: SODistance? {
        switch self {
        case .distance(let value):
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
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: DistanceOrQuantitativeValue?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SODistanceOrQuantitativeValue {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SODistance {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOQuantitativeValue {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [DistanceOrQuantitativeValue]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SODistanceOrQuantitativeValue] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SODistance {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOQuantitativeValue {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeDistanceOrQuantitativeValueIfPresent(forKey key: K) throws -> DistanceOrQuantitativeValue? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SODistanceOrQuantitativeValue.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeDistancesOrQuantitativeValuesIfPresent(forKey key: K) throws -> [DistanceOrQuantitativeValue]? {
        guard contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SODistanceOrQuantitativeValue].self, forKey: key)
        } catch {
            return nil
        }
    }
}
