import Foundation
import SOSwiftVocabulary

// MARK: - PersonOrURL

public extension KeyedEncodingContainer {
    public mutating func encodePersonOrURL(_ value: PersonOrURL, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodePersonOrURLIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> PersonOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOPerson.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOPerson.self, from: data)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            return value
        } catch {
        }
        
        return nil
    }
}
