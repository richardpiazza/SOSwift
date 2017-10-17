import Foundation
import SOSwiftVocabulary

// MARK: - Value

public extension KeyedEncodingContainer {
    public mutating func encodeValue(_ value: Value, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOStructuredValue {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Bool {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Float {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeValueIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> Value? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOStructuredValue.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOStructuredValue.self, from: data)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(Bool.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(Float.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        return nil
    }
}
