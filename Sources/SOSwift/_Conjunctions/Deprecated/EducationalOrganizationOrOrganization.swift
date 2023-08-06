import Foundation
import CodablePlus

public enum EducationalOrganizationOrOrganization: Codable {
    case educationalOrganization(value: EducationalOrganization)
    case organization(value: Organization)
    
    public init(_ value: EducationalOrganization) {
        self = .educationalOrganization(value: value)
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
        case EducationalOrganization.schemaName:
            let value = try container.decode(EducationalOrganization.self)
            self = .educationalOrganization(value: value)
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
        case .educationalOrganization(let value):
            try container.encode(value)
        case .organization(let value):
            try container.encode(value)
        }
    }
    
    public var educationalOrganization: EducationalOrganization? {
        switch self {
        case .educationalOrganization(let value):
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
