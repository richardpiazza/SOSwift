import Foundation

public enum ImageObjectOrPhotograph: Codable {
    case imageObject(value: ImageObject)
    case photograph(value: Photograph)
    
    public init(_ value: ImageObject) {
        self = .imageObject(value: value)
    }
    
    public init(_ value: Photograph) {
        self = .photograph(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case ImageObject.schemaName:
            let value = try container.decode(ImageObject.self)
            self = .imageObject(value: value)
        case Photograph.schemaName:
            let value = try container.decode(Photograph.self)
            self = .photograph(value: value)
        default:
            throw SchemaError.typeDecodingError
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
