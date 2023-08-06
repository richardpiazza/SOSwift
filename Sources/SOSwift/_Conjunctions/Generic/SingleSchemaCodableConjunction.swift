import CodablePlus

/// A type which represents a choice between two (2) options: the _first_ being `SchemaCodable` and the _last_ being `Codable`.
public enum SingleSchemaCodableConjunction<First: SchemaCodable, Second: Codable & Equatable>: Codable {
    case first(First)
    case second(Second)

    public init(_ value: First) {
        self = .first(value)
    }

    public init(_ value: Second) {
        self = .second(value)
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
            let value = try container.decode(Second.self)
            self = .second(value)
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
