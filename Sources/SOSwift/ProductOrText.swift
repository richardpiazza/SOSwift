import Foundation

public enum ProductOrText: Codable {
    case product(value: Product)
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
        
        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaErrors.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Product.schemaType:
            let value = try container.decode(Product.self)
            self = .product(value: value)
        default:
            throw SchemaErrors.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .product(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
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
    
    public var text: String? {
        switch self {
        case .text(let value):
            return value
        default:
            return nil
        }
    }
}
