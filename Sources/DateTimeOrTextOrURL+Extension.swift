import Foundation
import SOSwiftVocabulary

// MARK: - DateTimeOrTextOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeDateTimeOrTextOrURL(_ value: DateTimeOrTextOrURL, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDateTimeOrTextOrURLIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> DateTimeOrTextOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
}
