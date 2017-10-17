import Foundation
import SOSwiftVocabulary

// MARK: - ProductOrText

public extension KeyedEncodingContainer {
    public mutating func encodeProductOrText(_ value: ProductOrText, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeProductOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> ProductOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOProduct.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOProduct.self, from: data)
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
