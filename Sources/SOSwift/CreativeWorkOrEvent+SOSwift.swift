import Foundation
import SOSwiftVocabulary

// MARK: - CreativeWorkOrEvent

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: CreativeWorkOrEvent?, forKey key: K) throws {
        if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOEvent {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeCreativeWorkOrEventIfPresent(forKey key: K) throws -> CreativeWorkOrEvent? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOCreativeWork.type {
                return try self.decode(SOCreativeWork.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOEvent.type {
                return try self.decode(SOEvent.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `CreativeWorkOrEvent` for key: \(key.stringValue).")
        
        return nil
    }
}

