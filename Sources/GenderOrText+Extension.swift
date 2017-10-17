import Foundation
import SOSwiftVocabulary

// MARK: - GenderOrText

public extension KeyedEncodingContainer {
    public mutating func encodeGenderOrText(_ value: GenderOrText, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? Gender {
            try self.encode(typedValue.rawValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeGenderOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> GenderOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            if let gender = Gender(rawValue: value) {
                return gender
            }
            return value
        } catch {
        }
        
        return nil
    }
}
