import Foundation

public enum ItemListOrMusicRecording: Codable {
    case itemList(value: ItemList)
    case musicRecording(value: MusicRecording)
    
    public init(_ value: ItemList) {
        self = .itemList(value: value)
    }
    
    public init(_ value: MusicRecording) {
        self = .musicRecording(value: value)
    }
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: DictionaryKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SchemaKeys.type.rawValue] as? String else {
            throw SchemaError.typeDecodingError
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case ItemList.schemaName:
            let value = try container.decode(ItemList.self)
            self = .itemList(value: value)
        case MusicRecording.schemaName:
            let value = try container.decode(MusicRecording.self)
            self = .musicRecording(value: value)
        default:
            throw SchemaError.typeDecodingError
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .itemList(let value):
            try container.encode(value)
        case .musicRecording(let value):
            try container.encode(value)
        }
    }
    
    public var itemList: ItemList? {
        switch self {
        case .itemList(let value):
            return value
        default:
            return nil
        }
    }
    
    public var musicRecording: MusicRecording? {
        switch self {
        case .musicRecording(let value):
            return value
        default:
            return nil
        }
    }
}
