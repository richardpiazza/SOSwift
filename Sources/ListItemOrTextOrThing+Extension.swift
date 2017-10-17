import Foundation
import SOSwiftVocabulary

// MARK: - ListItemOrTextOrThing

public extension KeyedEncodingContainer {
    public mutating func encodeListItemOrTextOrThing(_ value: ListItemOrTextOrThing, forKey key: KeyedEncodingContainer.Key) throws {
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
    public func decodeListItemOrTextOrThingIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> ListItemOrTextOrThing? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            let data = try JSONEncoder().encode(value)
            
            if value["@type"] as? String == SOListItem.type {
                return try JSONDecoder().decode(SOListItem.self, from: data)
            } else if value["@type"] as? String == SOThing.type {
                return try JSONDecoder().decode(SOThing.self, from: data)
            }
        } catch {
        }
        
        do {
            let value = try self.decodeIfPresent(String.self, forKey: key)
            return value
        } catch {
        }
        
        return nil
    }
}
