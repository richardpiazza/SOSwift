import Foundation
import SOSwiftVocabulary

// MARK: - Number

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: Number?, forKey key: K) throws {
        if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Double {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeNumberIfPresent(forKey key: K) throws -> Number? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(Double.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `Number` for key: \(key.stringValue).")
        
        return nil
    }
}
