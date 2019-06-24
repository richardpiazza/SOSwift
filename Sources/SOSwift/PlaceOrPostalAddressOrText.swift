import Foundation

public enum PlaceOrPostalAddressOrText: Codable {
    case place(value: Place)
    case postalAddress(value: PostalAddress)
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
        case Place.schemaType:
            let value = try container.decode(Place.self)
            self = .place(value: value)
        case PostalAddress.schemaType:
            let value = try container.decode(PostalAddress.self)
            self = .postalAddress(value: value)
        default:
            throw SchemaErrors.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .place(let value):
            try container.encode(value)
        case .postalAddress(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var place: Place? {
        switch self {
        case .place(let value):
            return value
        default:
            return nil
        }
    }
    
    public var postalAddress: PostalAddress? {
        switch self {
        case .postalAddress(let value):
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
