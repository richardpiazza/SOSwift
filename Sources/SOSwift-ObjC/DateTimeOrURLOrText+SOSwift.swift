import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - DateTimeOrURLOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: DateTimeOrURLOrText?, forKey key: K) throws {
        if let typedValue = value as? DateTime {
            try self.encodeIfPresent(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeDateTimeOrURLOrTextIfPresent(forKey key: K) throws -> DateTimeOrURLOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            if let value = try self.decodeDateTimeIfPresent(forKey: key) {
                return value
            }
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value as NSURL
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value as NSString
        } catch {
        }
        
        print("Failed to decode `DateTimeOrTextOrURL` for key: \(key.stringValue).")
        
        return nil
    }
}
