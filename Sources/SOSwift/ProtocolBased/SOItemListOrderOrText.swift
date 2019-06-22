import Foundation
import SOSwiftVocabulary

public enum SOItemListOrderOrText: ItemListOrderOrText, Codable {
    case itemListOrder(value: ItemListOrder)
    case text(value: String)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let value = try container.decode(String.self)
        
        if let itemListOrder = ItemListOrder(rawValue: value) {
            self = .itemListOrder(value: itemListOrder)
        } else {
            self = .text(value: value)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .itemListOrder(let value):
            try container.encode(value.rawValue)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var itemListOrder: ItemListOrder? {
        switch self {
        case .itemListOrder(let value):
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

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ItemListOrderOrText?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOItemListOrMusicRecording {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? ItemListOrder {
            try self.encode(typedValue.rawValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [ItemListOrderOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOItemListOrMusicRecording] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? ItemListOrder {
                try container.encode(typedValue.rawValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeItemListOrderOrTextIfPresent(forKey key: K) throws -> ItemListOrderOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOItemListOrderOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeItemListOrdersOrTextsIfPresent(forKey key: K) throws -> [ItemListOrderOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOItemListOrderOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
