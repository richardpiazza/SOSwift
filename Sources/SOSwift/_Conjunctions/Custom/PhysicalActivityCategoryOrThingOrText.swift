import CodablePlus
import Foundation

public enum PhysicalActivityCategoryOrThingOrText: Codable {
    case physicalActivityCategory(value: PhysicalActivityCategory)
    case thing(value: Thing)
    case text(value: String)

    public init(_ value: PhysicalActivityCategory) {
        self = .physicalActivityCategory(value: value)
    }

    public init(_ value: Thing) {
        self = .thing(value: value)
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

            if let physicalActivityCategory = PhysicalActivityCategory(rawValue: value) {
                self = .physicalActivityCategory(value: physicalActivityCategory)
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
        case Thing.schemaName:
            let value = try container.decode(Thing.self)
            self = .thing(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .physicalActivityCategory(let value):
            try container.encode(value.rawValue)
        case .thing(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }

    public var physicalActivityCategory: PhysicalActivityCategory? {
        switch self {
        case .physicalActivityCategory(let value):
            value
        default:
            nil
        }
    }

    public var thing: Thing? {
        switch self {
        case .thing(let value):
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
