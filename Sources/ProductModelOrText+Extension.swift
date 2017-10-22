import Foundation
import SOSwiftVocabulary

// MARK: - ProductModelOrText

public extension KeyedEncodingContainer {
    public mutating func encodeProductModelOrText(_ value: ProductModelOrText, forKey key: K) throws {
        if let typedValue = value as? SOProductModel {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeProductModelOrTextIfPresent(forKey key: K) throws -> ProductModelOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOProductModel.type {
                return try self.decode(SOProductModel.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `ProductModelOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
