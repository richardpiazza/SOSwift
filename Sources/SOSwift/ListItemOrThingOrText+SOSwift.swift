import Foundation
import SOSwiftVocabulary

// MARK: - ListItemOrThingOrText

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ListItemOrThingOrText?, forKey key: K) throws {
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
    func decodeListItemOrThingOrTextIfPresent(forKey key: K) throws -> ListItemOrThingOrText? {
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
