import Foundation
import SOSwiftVocabulary

// MARK: - ProductOrTextOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeProductOrTextOrURL(_ value: ProductOrTextOrURL, forKey key: K) throws {
        if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeProductOrTextOrURLIfPresent(forKey key: K) throws -> ProductOrTextOrURL? {
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
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `ProductOrTextOrURL` for key: \(key.stringValue).")
        
        return nil
    }
}
