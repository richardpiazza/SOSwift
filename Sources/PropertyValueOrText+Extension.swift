import Foundation
import SOSwiftVocabulary

// MARK: - PropertyValueOrText

public extension KeyedEncodingContainer {
    public mutating func encodePropertyValueOrText(_ value: PropertyValueOrText, forKey key: K) throws {
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
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOPropertyValue.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOPropertyValue.self, from: data)
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
