import Foundation
import SOSwiftVocabulary

public enum SOAreaServed: AreaServed, Codable {
    case administrativeArea(value: SOAdministrativeArea)
    case geoShape(value: SOGeoShape)
    case place(value: SOPlace)
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
        case SOAdministrativeArea.type:
            let value = try container.decode(SOAdministrativeArea.self)
            self = .administrativeArea(value: value)
        case SOGeoShape.type:
            let value = try container.decode(SOGeoShape.self)
            self = .geoShape(value: value)
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
        case .administrativeArea(let value):
            try container.encode(value)
        case .geoShape(let value):
            try container.encode(value)
        case .place(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var administrativeArea: SOAdministrativeArea? {
        switch self {
        case .administrativeArea(let value):
            return value
        default:
            return nil
        }
    }
    
    public var geoShape: SOGeoShape? {
        switch self {
        case .geoShape(let value):
            return value
        default:
            return nil
        }
    }
    
    public var place: SOPlace? {
        switch self {
        case .place(let value):
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

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: AreaServed?, forKey key: K) throws {
        if let typedValue = value as? SOAdministrativeArea {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOGeoShape {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeAreaServedIfPresent(forKey key: K) throws -> AreaServed? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOAdministrativeArea.type {
                return try self.decode(SOAdministrativeArea.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOGeoShape.type {
                return try self.decode(SOGeoShape.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOPlace.type {
                return try self.decode(SOPlace.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `AreaServed` for key: \(key.stringValue).")
        
        return nil
    }
}
