import Foundation
import SOSwiftVocabulary

public enum SOGeoShapeOrPlaceOrText: GeoShapeOrPlaceOrText, Codable {
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
        case .geoShape(let value):
            try container.encode(value)
        case .place(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
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

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: GeoShapeOrPlaceOrText?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOGeoShapeOrPlaceOrText {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOGeoShape {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [GeoShapeOrPlaceOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOGeoShapeOrPlaceOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOGeoShape {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOPlace {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeGeoShapeOrPlaceOrTextIfPresent(forKey key: K) throws -> GeoShapeOrPlaceOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOGeoShapeOrPlaceOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeGeoShapesOrPlacesOrTextsIfPresent(forKey key: K) throws -> [GeoShapeOrPlaceOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOGeoShapeOrPlaceOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
