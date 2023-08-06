import CodablePlus

/// A type which represents a choice between three (5) options; all of which are `SchemaCodable`.
public enum QuadrupleSchemaConjunction<
    First: SchemaCodable,
    Second: SchemaCodable,
    Third: SchemaCodable,
    Fourth: SchemaCodable,
    Fifth: SchemaCodable
>: Codable {
    case first(First)
    case second(Second)
    case third(Third)
    case fourth(Fourth)
    case fifth(Fifth)
    
    public init(_ value: First) {
        self = .first(value)
    }
    
    public init(_ value: Second) {
        self = .second(value)
    }
    
    public init(_ value: Third) {
        self = .third(value)
    }
    
    public init(_ value: Fourth) {
        self = .fourth(value)
    }
    
    public init(_ value: Fifth) {
        self = .fifth(value)
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
        case Third.schemaName:
            let value = try container.decode(Third.self)
            self = .third(value)
        case Fourth.schemaName:
            let value = try container.decode(Fourth.self)
            self = .fourth(value)
        case Fifth.schemaName:
            let value = try container.decode(Fifth.self)
            self = .fifth(value)
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
        case .third(let value):
            try container.encode(value)
        case .fourth(let value):
            try container.encode(value)
        case .fifth(let value):
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
    
    public var third: Third? {
        guard case .third(let value) = self else {
            return nil
        }
        
        return value
    }
    
    public var fourth: Fourth? {
        guard case .fourth(let value) = self else {
            return nil
        }
        
        return value
    }
    
    public var fifth: Fifth? {
        guard case .fifth(let value) = self else {
            return nil
        }
        
        return value
    }
}
