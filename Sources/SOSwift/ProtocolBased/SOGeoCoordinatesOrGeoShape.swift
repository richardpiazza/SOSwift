import Foundation
import SOSwiftVocabulary

public enum SOGeoCoordinatesOrGeoShape: GeoCoordinatesOrGeoShape, Codable {
    case geoCoordinates(value: SOGeoCoordinates)
    case geoShape(value: SOGeoShape)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOGeoCoordinates.type:
            let value = try container.decode(SOGeoCoordinates.self)
            self = .geoCoordinates(value: value)
        case SOGeoShape.type:
            let value = try container.decode(SOGeoShape.self)
            self = .geoShape(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .geoCoordinates(let value):
            try container.encode(value)
        case .geoShape(let value):
            try container.encode(value)
        }
    }
    
    public var geoCoordinates: SOGeoCoordinates? {
        switch self {
        case .geoCoordinates(let value):
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
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: GeoCoordinatesOrGeoShape?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue =  value as? SOGeoCoordinatesOrGeoShape {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOGeoCoordinates {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOGeoShape {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [GeoCoordinatesOrGeoShape]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue =  value as? [SOGeoCoordinatesOrGeoShape] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOGeoCoordinates {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOGeoShape {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeGeoCoordinatesOrGeoShapeIfPresent(forKey key: K) throws -> GeoCoordinatesOrGeoShape? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOGeoCoordinatesOrGeoShape.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeGeoCoordinatesOrGeoShapesIfPresent(forKey key: K) throws -> [GeoCoordinatesOrGeoShape]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOGeoCoordinatesOrGeoShape].self, forKey: key)
        } catch {
            return nil
        }
    }
}
