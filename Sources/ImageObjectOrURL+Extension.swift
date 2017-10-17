import Foundation
import SOSwiftVocabulary

// MARK: - ImageObjectOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeImageObjectOrURL(_ value: ImageObjectOrURL, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOImageObject {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeImageObjectOrURLIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> ImageObjectOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOImageObject.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOImageObject.self, from: data)
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
