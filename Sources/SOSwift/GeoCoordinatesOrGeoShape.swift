import Foundation
import CodablePlus

public enum GeoCoordinatesOrGeoShape: Codable {
    case geoCoordinates(value: GeoCoordinates)
    case geoShape(value: GeoShape)
    
    public init(_ value: GeoCoordinates) {
        self = .geoCoordinates(value: value)
    }
    
    public init(_ value: GeoShape) {
        self = .geoShape(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case GeoCoordinates.schemaName:
            let value = try container.decode(GeoCoordinates.self)
            self = .geoCoordinates(value: value)
        case GeoShape.schemaName:
            let value = try container.decode(GeoShape.self)
            self = .geoShape(value: value)
        default:
            throw SchemaError.typeDecodingError
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
    
    public var geoCoordinates: GeoCoordinates? {
        switch self {
        case .geoCoordinates(let value):
            return value
        default:
            return nil
        }
    }
    
    public var geoShape: GeoShape? {
        switch self {
        case .geoShape(let value):
            return value
        default:
            return nil
        }
    }
}
