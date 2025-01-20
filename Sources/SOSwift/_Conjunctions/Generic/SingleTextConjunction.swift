import CodablePlus

/// A type which represents a choice between two (2) options: the `First` being `SchemaCodable` and the _last_ being `String`.
public enum SingleTextConjunction<First: SchemaCodable>: Codable {
    case first(First)
    case last(String)

    public init(_ value: First) {
        self = .first(value)
    }

    public init(_ value: String) {
        self = .last(value)
    }

    public init(from decoder: Decoder) throws {
        var dictionary: [String: Any]?

        do {
            let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
            dictionary = try jsonContainer.decode([String: Any].self)
        } catch {}

        guard let jsonDictionary = dictionary else {
            let value = try decoder.stringContents()
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
        default:
            throw SchemaError.typeDecodingError
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .first(let value):
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

    public var last: String? {
        guard case .last(let value) = self else {
            return nil
        }

        return value
    }

    public var text: String? { last }

    public static func text(value: String) -> Self {
        .last(value)
    }
}
