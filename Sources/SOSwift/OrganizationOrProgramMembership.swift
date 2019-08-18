import Foundation

public enum OrganizationOrProgramMembership: Codable {
    case organization(value: Organization)
    case programMembership(value: ProgramMembership)
    
    public init(_ value: Organization) {
        self = .organization(value: value)
    }
    
    public init(_ value: ProgramMembership) {
        self = .programMembership(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Organization.schemaName:
            let value = try container.decode(Organization.self)
            self = .organization(value: value)
        case ProgramMembership.schemaName:
            let value = try container.decode(ProgramMembership.self)
            self = .programMembership(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .organization(let value):
            try container.encode(value)
        case .programMembership(let value):
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
    
    public var programMembership: ProgramMembership? {
        switch self {
        case .programMembership(let value):
            return value
        default:
            return nil
        }
    }
}
