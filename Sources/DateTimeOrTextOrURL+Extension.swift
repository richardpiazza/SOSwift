import Foundation
import SOSwiftVocabulary

// MARK: - DateTimeOrTextOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: DateTimeOrTextOrURL?, forKey key: K) throws {
        if let typedValue = value as? DateTime {
            try self.encodeIfPresent(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDateTimeOrTextOrURLIfPresent(forKey key: K) throws -> DateTimeOrTextOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value
            }
        } catch {
        }
        
        do {
            if let value = try self.decodeDateTimeIfPresent(forKey: key) {
                if value.date != nil {
                    return value
                }
            }
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `DateTimeOrTextOrURL` for key: \(key.stringValue).")
        
        return nil
    }
}
