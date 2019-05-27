import Foundation
import SOSwiftVocabulary

public enum SOContactPointOrPlace: ContactPointOrPlace, Codable {
    case contactPoint(value: SOContactPoint)
    case place(value: SOPlace)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOContactPoint.type:
            let value = try container.decode(SOContactPoint.self)
            self = .contactPoint(value: value)
        case SOPlace.type:
            let value = try container.decode(SOPlace.self)
            self = .place(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .contactPoint(let value):
            try container.encode(value)
        case .place(let value):
            try container.encode(value)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeContactPointOrPlaceIfPresent(forKey key: K) throws -> ContactPointOrPlace? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOContactPointOrPlace.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeContactPointsOrPlacesIfPresent(forKey key: K) throws -> [ContactPointOrPlace]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOContactPointOrPlace].self, forKey: key)
        } catch {
            return nil
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ContactPointOrPlace?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOContactPointOrPlace {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOContactPoint {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [ContactPointOrPlace]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOContactPointOrPlace] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOContactPoint {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOPlace {
                try container.encode(typedValue)
            }
        })
    }
}
