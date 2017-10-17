import Foundation
import SOSwiftVocabulary

// MARK: - Number

public extension KeyedEncodingContainer {
    public mutating func encodeNumber(_ value: Number, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Float {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeNumberIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> Number? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        do {
            let value = try self.decode(Float.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
}
