import Foundation
import SOSwiftVocabulary

// MARK: - DateOnlyOrDateTime

public extension KeyedEncodingContainer {
    public mutating func encodeDateOnlyOrDateTime(_ value: DateOnlyOrDateTime, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? DateTime {
            try self.encodeDateTime(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDateOnlyOrDateTimeIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> DateOnlyOrDateTime? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeDateTimeIfPresent(forKey: key) {
                return value
            }
        } catch {
            print(error)
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
}
