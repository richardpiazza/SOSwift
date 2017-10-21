import Foundation
import SOSwiftVocabulary

// MARK: - MusicGroupOrPerson

public extension KeyedEncodingContainer {
    public mutating func encodeMusicGroupOrPerson(_ value: MusicGroupOrPerson, forKey key: K) throws {
        if let typedValue = value as? SOMusicGroup {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeMusicGroupOrPersonIfPresent(forKey key: K) throws -> MusicGroupOrPerson? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOMusicGroup.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOMusicGroup.self, from: data)
            } else if value["@type"] as? String == SOPerson.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOPerson.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
