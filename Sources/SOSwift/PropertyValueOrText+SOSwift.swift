import Foundation
import SOSwiftVocabulary

// MARK: - PropertyValueOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: PropertyValueOrText?, forKey key: K) throws {
        if let typedValue = value as? SOPropertyValue {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodePropertyValueOrTextIfPresent(forKey key: K) throws -> PropertyValueOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOPropertyValue.type {
                return try self.decode(SOPropertyValue.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `PropertyValueOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
