import Foundation
import SOSwiftVocabulary

// MARK: - CreativeWorkOrURL

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: CreativeWorkOrURL?, forKey key: K) throws {
        if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeCreativeWorkOrURLIfPresent(forKey key: K) throws -> CreativeWorkOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOCreativeWork.type {
                return try self.decode(SOCreativeWork.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value
            }
        } catch {
        }
        
        print("Failed to decode `CreativeWorkOrURL` for key: \(key.stringValue).")
        
        return nil
    }
}
