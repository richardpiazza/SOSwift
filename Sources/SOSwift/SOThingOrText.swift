import Foundation
import SOSwiftVocabulary

// MARK: - ThingOrText

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ThingOrText?, forKey key: K) throws {
        if let typedValue = value as? SOThing {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeThingOrTextIfPresent(forKey key: K) throws -> ThingOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOThing.type {
                return try self.decode(SOThing.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `TextOrThing` for key: \(key.stringValue).")
        
        return nil
    }
}
