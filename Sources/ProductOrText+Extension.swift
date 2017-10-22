import Foundation
import SOSwiftVocabulary

// MARK: - ProductOrText

public extension KeyedEncodingContainer {
    public mutating func encodeProductOrText(_ value: ProductOrText, forKey key: K) throws {
        if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeProductOrTextIfPresent(forKey key: K) throws -> ProductOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOProduct.type {
                return try self.decode(SOProduct.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `ProductOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
