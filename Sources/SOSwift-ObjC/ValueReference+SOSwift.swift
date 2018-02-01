import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - ValueReference

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: ValueReference?, forKey key: K) throws {
        if let typedValue = value as? SOEnumeration {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOStructuredValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeValueReferenceIfPresent(forKey key: K) throws -> ValueReference? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOEnumeration.type {
                return try self.decode(SOEnumeration.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOStructuredValue.type {
                return try self.decode(SOStructuredValue.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `Value` for key: \(key.stringValue).")
        
        return nil
    }
}
