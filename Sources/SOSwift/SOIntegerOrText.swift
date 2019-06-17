import Foundation
import SOSwiftVocabulary

// MARK: - IntegerOrText

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: IntegerOrText?, forKey key: K) throws {
        if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeIntegerOrTextIfPresent(forKey key: K) throws -> IntegerOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `IntegerOrText` for key: \(key.stringValue).")
        
        return nil
    }
}