import Foundation
import SOSwiftVocabulary

// MARK: - NumberOrText

public extension KeyedEncodingContainer {
    public mutating func encodeNumberOrText(_ value: NumberOrText, forKey key: K) throws {
        if let typedValue = value as? Number {
            try self.encodeNumber(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeNumberOrTextIfPresent(forKey key: K) throws -> NumberOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeNumberIfPresent(forKey: key) {
                return value
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `NumberOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
