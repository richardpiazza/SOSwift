import Foundation
import CodablePlus

public enum ProductOrService: Codable {
    case product(value: Product)
    case service(value: Service)
    
    public init(_ value: Product) {
        self = .product(value: value)
    }
    
    public init(_ value: Service) {
        self = .service(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Product.schemaName:
            let value = try container.decode(Product.self)
            self = .product(value: value)
        case Service.schemaName:
            let value = try container.decode(Service.self)
            self = .service(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .product(let value):
            try container.encode(value)
        case .service(let value):
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
    
    public var service: Service? {
        switch self {
        case .service(let value):
            return value
        default:
            return nil
        }
    }
}
