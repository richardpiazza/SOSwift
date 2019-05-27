import Foundation
import SOSwiftVocabulary

// MARK: - DateOnlyOrDateTime

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: DateOnlyOrDateTime?, forKey key: K) throws {
        if let typedValue = value as? DateTime {
            try self.encodeIfPresent(typedValue, forKey: key)
        } else if let typedValue = value as? DateOnly {
            try self.encodeIfPresent(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeDateOnlyOrDateTimeIfPresent(forKey key: K) throws -> DateOnlyOrDateTime? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeDateTimeIfPresent(forKey: key) {
                return value
            }
        } catch {
        }
        
        do {
            if let value = try self.decodeDateOnlyIfPresent(forKey: key) {
                return value
            }
        } catch {
        }
        
        print("Failed to decode `DateOnlyOrDateTime` for key \(key.stringValue).")
        
        return nil
    }
}
