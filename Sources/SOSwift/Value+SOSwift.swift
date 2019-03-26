import Foundation
import SOSwiftVocabulary

// MARK: - Value

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: Value?, forKey key: K) throws {
        if let typedValue = value as? SOStructuredValue {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Bool {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Double {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeValueIfPresent(forKey key: K) throws -> Value? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOStructuredValue.type {
                return try self.decode(SOStructuredValue.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(Bool.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(Double.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `Value` for key: \(key.stringValue).")
        
        return nil
    }
}
