import Foundation
import SOSwiftVocabulary

// MARK: - ValueReference

public extension KeyedEncodingContainer {
    public mutating func encodeValueReference(_ value: ValueReference, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOEnumeration {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOStructuredValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeValueReferenceIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> ValueReference? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOEnumeration.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOEnumeration.self, from: data)
            } else if value["@type"] as? String == SOStructuredValue.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOStructuredValue.self, from: data)
            }
        } catch {
        }
        
        return nil
    }
}
