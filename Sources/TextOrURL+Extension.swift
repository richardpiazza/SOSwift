import Foundation
import SOSwiftVocabulary

// MARK: - TextOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeTextOrURL(_ value: TextOrURL, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeTextOrURLIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> TextOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            return value
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
