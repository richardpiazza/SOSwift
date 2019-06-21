import Foundation
import SOSwiftVocabulary

public enum SOItemListOrMusicRecording: ItemListOrMusicRecording, Codable {
    case itemList(value: SOItemList)
    case musicRecording(value: SOMusicRecording)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOItemList.type:
            let value = try container.decode(SOItemList.self)
            self = .itemList(value: value)
        case SOMusicRecording.type:
            let value = try container.decode(SOMusicRecording.self)
            self = .musicRecording(value: value)
        default:
            throw DynamicError.invalidTypeKey
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
    
    public var itemList: SOItemList? {
        switch self {
        case .itemList(let value):
            return value
        default:
            return nil
        }
    }
    
    public var musicRecording: SOMusicRecording? {
        switch self {
        case .musicRecording(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ItemListOrMusicRecording?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOItemListOrMusicRecording {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOItemList {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOMusicRecording {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [ItemListOrMusicRecording]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOItemListOrMusicRecording] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = self.nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOItemList {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOMusicRecording {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeItemListOrMusicRecordingIfPresent(forKey key: K) throws -> ItemListOrMusicRecording? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOItemListOrMusicRecording.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeItemListsOrMusicRecordingsIfPresent(forKey key: K) throws -> [ItemListOrMusicRecording]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOItemListOrMusicRecording].self, forKey: key)
        } catch {
            return nil
        }
    }
}
