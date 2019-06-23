import Foundation

public enum ImageObjectOrPhotograph: Codable {
    case imageObject(value: ImageObject)
    case photograph(value: Photograph)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[Schema.CodingKeys.type.rawValue] as? String else {
            throw Schema.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case ImageObject.schemaType:
            let value = try container.decode(ImageObject.self)
            self = .imageObject(value: value)
        case Photograph.schemaType:
            let value = try container.decode(Photograph.self)
            self = .photograph(value: value)
        default:
            throw Schema.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .imageObject(let value):
            try container.encode(value)
        case .photograph(let value):
            try container.encode(value)
        }
    }
    
    public var imageObject: ImageObject? {
        switch self {
        case .imageObject(let value):
            return value
        default:
            return nil
        }
    }
    
    public var photograph: Photograph? {
        switch self {
        case .photograph(let value):
            return value
        default:
            return nil
        }
    }
}
