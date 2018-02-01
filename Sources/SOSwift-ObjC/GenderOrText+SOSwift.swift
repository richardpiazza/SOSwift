import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - GenderOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: GenderOrText?, forKey key: K) throws {
        if let typedValue = value as? Gender {
            try self.encode(typedValue.rawValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeGenderOrTextIfPresent(forKey key: K) throws -> GenderOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            if let gender = Gender(stringValue: value) {
                return gender.rawValue as NSNumber
            }
            return value as NSString
        } catch {
        }
        
        print("Failed to decode `GenderOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
