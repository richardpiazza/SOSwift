import Foundation

public enum MusicGroupOrPerson: Codable {
    case musicGroup(value: MusicGroup)
    case person(value: Person)
    
    public init(_ value: MusicGroup) {
        self = .musicGroup(value: value)
    }
    
    public init(_ value: Person) {
        self = .person(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case MusicGroup.schemaName:
            let value = try container.decode(MusicGroup.self)
            self = .musicGroup(value: value)
        case Person.schemaName:
            let value = try container.decode(Person.self)
            self = .person(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .musicGroup(let value):
            try container.encode(value)
        case .person(let value):
            try container.encode(value)
        }
    }
    
    public var musicGroup: MusicGroup? {
        switch self {
        case .musicGroup(let value):
            return value
        default:
            return nil
        }
    }
    
    public var person: Person? {
        switch self {
        case .person(let value):
            return value
        default:
            return nil
        }
    }
}
