import Foundation
import CodablePlus

public enum MapOrURL: Codable {
    case map(value: Map)
    case url(value: URL)
    
    public init(_ value: Map) {
        self = .map(value: value)
    }
    
    public init(_ value: URL) {
        self = .url(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(URL.self)
            self = .url(value: value)
            return
        }
        
        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case Map.schemaName:
            let value = try container.decode(Map.self)
            self = .map(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .map(let value):
            try container.encode(value)
        case .url(let value):
            try container.encode(value)
        }
    }
    
    public var map: Map? {
        switch self {
        case .map(let value):
            return value
        default:
            return nil
        }
    }
    
    public var url: URL? {
        switch self {
        case .url(let value):
            return value
        default:
            return nil
        }
    }
}
