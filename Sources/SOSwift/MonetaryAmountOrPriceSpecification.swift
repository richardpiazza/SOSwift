import Foundation

public enum MonetaryAmountOrPriceSpecification: Codable {
    case monetaryAmount(value: MonetaryAmount)
    case priceSpecification(value: PriceSpecification)
    
    public init(_ value: MonetaryAmount) {
        self = .monetaryAmount(value: value)
    }
    
    public init(_ value: PriceSpecification) {
        self = .priceSpecification(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case MonetaryAmount.schemaType:
            let value = try container.decode(MonetaryAmount.self)
            self = .monetaryAmount(value: value)
        case PriceSpecification.schemaType:
            let value = try container.decode(PriceSpecification.self)
            self = .priceSpecification(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .monetaryAmount(let value):
            try container.encode(value)
        case .priceSpecification(let value):
            try container.encode(value)
        }
    }
    
    public var monetaryAmount: MonetaryAmount? {
        switch self {
        case .monetaryAmount(let value):
            return value
        default:
            return nil
        }
    }
    
    public var priceSpecification: PriceSpecification? {
        switch self {
        case .priceSpecification(let value):
            return value
        default:
            return nil
        }
    }
}
