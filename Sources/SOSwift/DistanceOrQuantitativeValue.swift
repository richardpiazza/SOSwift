import Foundation

public enum DistanceOrQuantitativeValue: Codable {
    case distance(value: Distance)
    case quantitativeValue(value: QuantitativeValue)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Distance.schemaType:
            let value = try container.decode(Distance.self)
            self = .distance(value: value)
        case QuantitativeValue.schemaType:
            let value = try container.decode(QuantitativeValue.self)
            self = .quantitativeValue(value: value)
        default:
            throw SchemaError.typeDecodingError
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
    
    public var distance: Distance? {
        switch self {
        case .distance(let value):
            return value
        default:
            return nil
        }
    }
    
    public var quantitativeValue: QuantitativeValue? {
        switch self {
        case .quantitativeValue(let value):
            return value
        default:
            return nil
        }
    }
}
