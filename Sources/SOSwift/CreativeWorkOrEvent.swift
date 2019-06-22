import Foundation

public enum CreativeWorkOrEvent: Codable {
    case creativeWork(value: CreativeWork)
    case event(value: Event)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[Schema.CodingKeys.type.rawValue] as? String else {
            throw Schema.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case CreativeWork.schemaType:
            let value = try container.decode(CreativeWork.self)
            self = .creativeWork(value: value)
        case Event.schemaType:
            let value = try container.decode(Event.self)
            self = .event(value: value)
        default:
            throw Schema.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .creativeWork(let value):
            try container.encode(value)
        case .event(let value):
            try container.encode(value)
        }
    }
    
    public var creativeWork: CreativeWork? {
        switch self {
        case .creativeWork(let value):
            return value
        default:
            return nil
        }
    }
    
    public var event: Event? {
        switch self {
        case .event(let value):
            return value
        default:
            return nil
        }
    }
}
