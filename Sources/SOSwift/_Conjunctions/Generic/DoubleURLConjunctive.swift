import Foundation
import CodablePlus

/// A type which represents a choice between three (3) options; The _last_ always being of type `URL`.
public enum DoubleURLConjunction<First: SchemaCodable, Second: SchemaCodable>: Codable {
    case first(First)
    case second(Second)
    case last(URL)
    
    public init(_ value: First) {
        self = .first(value)
    }
    
    public init(_ value: Second) {
        self = .second(value)
    }
    
    public init(_ value: URL) {
        self = .last(value)
    }
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
        }
        
        guard let jsonDictionary = dictionary else {
            let value = try decoder.urlContents()
            self = .last(value)
            return
        }
        
        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case First.schemaName:
            let value = try container.decode(First.self)
            self = .first(value)
        case Second.schemaName:
            let value = try container.decode(Second.self)
            self = .second(value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .first(let value):
            try container.encode(value)
        case .second(let value):
            try container.encode(value)
        case .last(let value):
            try container.encode(value)
        }
    }
    
    public var first: First? {
        guard case .first(let value) = self else {
            return nil
        }
        
        return value
    }
    
    public var second: Second? {
        guard case .second(let value) = self else {
            return nil
        }
        
        return value
    }
    
    public var last: URL? {
        guard case .last(let value) = self else {
            return nil
        }
        
        return value
    }
    
    public var url: URL? { last }
    
    public static func url(value: URL) -> Self {
        .last(value)
    }
}
