import Foundation
import SOSwiftVocabulary

// MARK: - MapOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeMapOrURL(_ value: MapOrURL, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOMap {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeMapOrURLIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> MapOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOMap.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOMap.self, from: data)
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
