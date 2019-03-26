import Foundation
import SOSwiftVocabulary

// MARK: - MusicGroupOrPerson

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: MusicGroupOrPerson?, forKey key: K) throws {
        if let typedValue = value as? SOMusicGroup {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeMusicGroupOrPersonIfPresent(forKey key: K) throws -> MusicGroupOrPerson? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOMusicGroup.type {
                return try self.decode(SOMusicGroup.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOPerson.type {
                return try self.decode(SOPerson.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `MusicGroupOrPerson` for key: \(key.stringValue).")
        
        return nil
    }
}
