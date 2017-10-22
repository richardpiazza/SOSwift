import Foundation
import SOSwiftVocabulary

// MARK: - ListItemOrTextOrThing

public extension KeyedEncodingContainer {
    public mutating func encodeListItemOrTextOrThing(_ value: ListItemOrTextOrThing, forKey key: K) throws {
        if let typedValue = value as? SOListItem {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOThing {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeListItemOrTextOrThingIfPresent(forKey key: K) throws -> ListItemOrTextOrThing? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOListItem.type {
                return try self.decode(SOListItem.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOThing.type {
                return try self.decode(SOThing.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `ListItemOrTextOrThing` for key: \(key.stringValue).")
        
        return nil
    }
}
