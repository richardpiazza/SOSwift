import CodablePlus

/// A type which represents a choice between two (2) options, both of which are `SchemaCodable`.
public enum SingleSchemaConjunction<First: SchemaCodable, Second: SchemaCodable>: Codable {
    case first(First)
    case second(Second)
    
    public init(_ value: First) {
        self = .first(value)
    }
    
    public init(_ value: Second) {
        self = .second(value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
        let jsonDictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
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
}
