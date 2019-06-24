import Foundation

public enum ContactPointOrPlace: Codable {
    case contactPoint(value: ContactPoint)
    case place(value: Place)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaErrors.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case ContactPoint.schemaType:
            let value = try container.decode(ContactPoint.self)
            self = .contactPoint(value: value)
        case Place.schemaType:
            let value = try container.decode(Place.self)
            self = .place(value: value)
        default:
            throw SchemaErrors.typeDecodingError
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
    
    public var contactPoint: ContactPoint? {
        switch self {
        case .contactPoint(let value):
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
}
