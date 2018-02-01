import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - DataFeedItemOrThingOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: DataFeedItemOrThingOrText?, forKey key: K) throws {
        if let typedValue = value as? SODataFeed {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOThing {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDataFeedItemOrThingOrTextIfPresent(forKey key: K) throws -> DataFeedItemOrThingOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SODataFeed.type {
                return try self.decode(SODataFeed.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOThing.type {
                return try self.decode(SOThing.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value as NSString
        } catch {
        }
        
        print("Failed to decode `DataFeedItemOrThingOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
