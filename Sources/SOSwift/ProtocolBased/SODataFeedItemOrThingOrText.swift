import Foundation
import SOSwiftVocabulary

public enum SODataFeedItemOrThingOrText: DataFeedItemOrThingOrText, Codable {
    case dataFeedItem(value: SODataFeedItem)
    case thing(value: SOThing)
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
        
        guard let type = jsonDictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SODataFeedItem.type:
            let value = try container.decode(SODataFeedItem.self)
            self = .dataFeedItem(value: value)
        case SOThing.type:
            let value = try container.decode(SOThing.self)
            self = .thing(value: value)
        default:
            throw DynamicError.invalidTypeKey
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
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: DataFeedItemOrThingOrText?, forKey key: K) throws {
        if let typedValue = value as? SODataFeedItemOrThingOrText {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SODataFeed {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOThing {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [DataFeedItemOrThingOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SODataFeedItemOrThingOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SODataFeedItem {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOThing {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeDataFeedItemOrThingOrTextIfPresent(forKey key: K) throws -> DataFeedItemOrThingOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SODataFeedItemOrThingOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeDataFeedItemsOrThingsOrTextsIfPresent(forKey key: K) throws -> [DataFeedItemOrThingOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SODataFeedItemOrThingOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
