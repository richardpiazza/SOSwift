import Foundation

public enum SoftwareApplicationOrWebsite: Codable {
    case softwareApplication(value: SoftwareApplication)
    case website(value: Website)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SoftwareApplication.schemaType:
            let value = try container.decode(SoftwareApplication.self)
            self = .softwareApplication(value: value)
        case Website.schemaType:
            let value = try container.decode(Website.self)
            self = .website(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .softwareApplication(let value):
            try container.encode(value)
        case .website(let value):
            try container.encode(value)
        }
    }
    
    public var softwareApplication: SoftwareApplication? {
        switch self {
        case .softwareApplication(let value):
            return value
        default:
            return nil
        }
    }
    
    public var website: Website? {
        switch self {
        case .website(let value):
            return value
        default:
            return nil
        }
    }
}
