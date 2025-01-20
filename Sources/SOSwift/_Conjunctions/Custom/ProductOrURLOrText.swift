import CodablePlus
import Foundation

public enum ProductOrURLOrText: Codable {
    case product(value: Product)
    case url(value: URL)
    case text(value: String)

    public init(_ value: Product) {
        self = .product(value: value)
    }

    public init(_ value: URL) {
        self = .url(value: value)
    }

    public init(_ value: String) {
        self = .text(value: value)
    }

    public init(from decoder: Decoder) throws {
        var dictionary: [String: Any]?

        do {
            let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
            dictionary = try jsonContainer.decode([String: Any].self)
        } catch {}

        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)

            if let url = URL(string: value), url.isValid {
                self = .url(value: url)
            } else {
                self = .text(value: value)
            }

            return
        }

        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }

        let container = try decoder.singleValueContainer()

        switch type {
        case Product.schemaName:
            let value = try container.decode(Product.self)
            self = .product(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .product(let value):
            try container.encode(value)
        case .url(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }

    public var product: Product? {
        switch self {
        case .product(let value):
            value
        default:
            nil
        }
    }

    public var url: URL? {
        switch self {
        case .url(let value):
            value
        default:
            nil
        }
    }

    public var text: String? {
        switch self {
        case .text(let value):
            value
        default:
            nil
        }
    }
}
