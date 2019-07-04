import Foundation

public typealias AdministrativeAreaOrGeoShapeOrPlaceOrText = AreaServed

public enum AreaServed: Codable {
    case administrativeArea(value: AdministrativeArea)
    case geoShape(value: GeoShape)
    case place(value: Place)
    case text(value: String)
    
    public init(_ value: AdministrativeArea) {
        self = .administrativeArea(value: value)
    }
    
    public init(_ value: GeoShape) {
        self = .geoShape(value: value)
    }
    
    public init(_ value: Place) {
        self = .place(value: value)
    }
    
    public init(_ value: String) {
        self = .text(value: value)
    }
    
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
        
        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case AdministrativeArea.schemaType:
            let value = try container.decode(AdministrativeArea.self)
            self = .administrativeArea(value: value)
        case GeoShape.schemaType:
            let value = try container.decode(GeoShape.self)
            self = .geoShape(value: value)
        case Place.schemaType:
            let value = try container.decode(Place.self)
            self = .place(value: value)
        default:
            throw SchemaError.typeDecodingError
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
    
    public var administrativeArea: AdministrativeArea? {
        switch self {
        case .administrativeArea(let value):
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
    
    public var place: Place? {
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
