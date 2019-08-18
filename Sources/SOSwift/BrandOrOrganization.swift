import Foundation

public enum BrandOrOrganization: Codable {
    case brand(value: Brand)
    case organization(value: Organization)
    
    public init(_ value: Brand) {
        self = .brand(value: value)
    }
    
    public init(_ value: Organization) {
        self = .organization(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Brand.schemaName:
            let value = try container.decode(Brand.self)
            self = .brand(value: value)
        case Organization.schemaName:
            let value = try container.decode(Organization.self)
            self = .organization(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .brand(let value):
            try container.encode(value)
        case .organization(let value):
            try container.encode(value)
        }
    }
    
    public var brand: Brand? {
        switch self {
        case .brand(let value):
            return value
        default:
            return nil
        }
    }
    
    public var organization: Organization? {
        switch self {
        case .organization(let value):
            return value
        default:
            return nil
        }
    }
}
