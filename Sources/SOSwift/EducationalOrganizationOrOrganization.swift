import Foundation

public enum EducationalOrganizationOrOrganization: Codable {
    case educationalOrganization(value: EducationalOrganization)
    case organization(value: Organization)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[Schema.CodingKeys.type.rawValue] as? String else {
            throw Schema.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case EducationalOrganization.schemaType:
            let value = try container.decode(EducationalOrganization.self)
            self = .educationalOrganization(value: value)
        case Organization.schemaType:
            let value = try container.decode(Organization.self)
            self = .organization(value: value)
        default:
            throw Schema.typeDecodingError
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
