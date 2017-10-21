import Foundation
import SOSwiftVocabulary

// MARK: - ImageObjectOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeImageObjectOrURL(_ value: ImageObjectOrURL, forKey key: K) throws {
        if let typedValue = value as? SOImageObject {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeImageObjectOrURLIfPresent(forKey key: K) throws -> ImageObjectOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary["@type"] as? String == SOImageObject.type {
                return try self.decode(SOImageObject.self, forKey: key)
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
        
        print("Failed to decode `ImageObjectOrURL` for key: \(key.stringValue).")
        
        return nil
    }
}
