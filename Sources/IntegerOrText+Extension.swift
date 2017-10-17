import Foundation
import SOSwiftVocabulary

// MARK: - IntegerOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIntegerOrText(_ value: IntegerOrText, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeIntegerOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> IntegerOrText? {
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
        
        return nil
    }
}
