import Foundation
import SOSwiftVocabulary

// MARK: - Duration

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Duration?, forKey key: K) throws {
        if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDurationIfPresent(forKey key: K) throws -> Duration? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `Duration` for key: \(key.stringValue).")
        
        return nil
    }
}
