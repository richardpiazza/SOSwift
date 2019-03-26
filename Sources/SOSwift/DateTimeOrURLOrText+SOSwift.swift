import Foundation
import SOSwiftVocabulary

// MARK: - DateTimeOrURLOrText

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: DateTimeOrURLOrText?, forKey key: K) throws {
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
    func decodeDateTimeOrURLOrTextIfPresent(forKey key: K) throws -> DateTimeOrURLOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeDateTimeIfPresent(forKey: key) {
                return value
            }
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value
            }
        } catch {
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
