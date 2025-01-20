import CodablePlus

/// A type which represents a choice between two (2) options: the `First` being `Codable` and the _last_ being `String`.
public enum SingleCodableTextConjunction<First: Codable & Equatable>: Codable, Equatable {
    case first(First)
    case last(String)

    public init(_ value: First) {
        self = .first(value)
    }

    public init(_ value: String) {
        self = .last(value)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        do {
            let value = try container.decode(First.self)
            self = .first(value)
            return
        } catch {}

        let value = try container.decode(String.self)
        self = .last(value)
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
