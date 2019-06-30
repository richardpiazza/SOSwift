import Foundation

public enum OrganizationOrPerson: Codable {
    case organization(value: Organization)
    case person(value: Person)
    
    public init(_ value: Organization) {
        self = .organization(value: value)
    }
    
    public init(_ value: Person) {
        self = .person(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Organization.schemaType:
            let value = try container.decode(Organization.self)
            self = .organization(value: value)
        case Person.schemaType:
            let value = try container.decode(Person.self)
            self = .person(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .organization(let value):
            try container.encode(value)
        case .person(let value):
            try container.encode(value)
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
    
    public var person: Person? {
        switch self {
        case .person(let value):
            return value
        default:
            return nil
        }
    }
}
