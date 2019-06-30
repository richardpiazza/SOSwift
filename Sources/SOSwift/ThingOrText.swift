import Foundation

public enum ThingOrText: Codable {
    case thing(value: Thing)
    case text(value: String)
    
    public init(_ value: Thing) {
        self = .thing(value: value)
    }
    
    public init(_ value: String) {
        self = .text(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let value = try container.decode(String.self)
            self = .text(value: value)
            return
        } catch {
        }
        
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        switch type {
        case Thing.schemaType:
            let value = try container.decode(Thing.self)
            self = .thing(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .thing(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var thing: Thing? {
        switch self {
        case .thing(let value):
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
