import Foundation

public enum DataFeedItemOrThingOrText: Codable {
    case dataFeedItem(value: DataFeedItem)
    case thing(value: Thing)
    case text(value: String)
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            self = .text(value: value)
            return
        }
        
        guard let type = jsonDictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case DataFeedItem.schemaType:
            let value = try container.decode(DataFeedItem.self)
            self = .dataFeedItem(value: value)
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
        case .dataFeedItem(let value):
            try container.encode(value)
        case .thing(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var dataFeedItem: DataFeedItem? {
        switch self {
        case.dataFeedItem(let value):
            return value
        default:
            return nil
        }
    }
    
    public var thing: Thing? {
        switch self {
        case.thing(let value):
            return value
        default:
            return nil
        }
    }
    
    public var text: String? {
        switch self {
        case.text(let value):
            return value
        default:
            return nil
        }
    }
}
