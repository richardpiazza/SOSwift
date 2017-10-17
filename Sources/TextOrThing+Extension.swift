import Foundation
import SOSwiftVocabulary

// MARK: - TextOrThing

public extension KeyedEncodingContainer {
    public mutating func encodeTextOrThing(_ value: TextOrThing, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOThing {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeTextOrThingIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> TextOrThing? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOThing.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOThing.self, from: data)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        return nil
    }
}
