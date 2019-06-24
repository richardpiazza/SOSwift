import Foundation

public enum OwnershipInfoOrProduct: Codable {
    case ownershipInfo(value: OwnershipInfo)
    case product(value: Product)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case OwnershipInfo.schemaType:
            let value = try container.decode(OwnershipInfo.self)
            self = .ownershipInfo(value: value)
        case Product.schemaType:
            let value = try container.decode(Product.self)
            self = .product(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .ownershipInfo(let value):
            try container.encode(value)
        case .product(let value):
            try container.encode(value)
        }
    }
    
    public var ownershipInfo: OwnershipInfo? {
        switch self {
        case .ownershipInfo(let value):
            return value
        default:
            return nil
        }
    }
    
    public var product: Product? {
        switch self {
        case .product(let value):
            return value
        default:
            return nil
        }
    }
}
