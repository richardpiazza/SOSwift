import Foundation

public enum LanguageOrText: Codable {
    case language(value: Language)
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
        
        guard let type = jsonDictionary[Schema.CodingKeys.type.rawValue] as? String else {
            throw Schema.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Language.schemaType:
            let value = try container.decode(Language.self)
            self = .language(value: value)
        default:
            throw Schema.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .language(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var language: Language? {
        switch self {
        case .language(let value):
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
