import Foundation
import SOSwiftVocabulary

// MARK: - OwnershipInfoOrProduct

public extension KeyedEncodingContainer {
    public mutating func encodeOwnershipInfoOrProduct(_ value: OwnershipInfoOrProduct, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOOwnershipInfo {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeOwnershipInfoOrProductIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> OwnershipInfoOrProduct? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            let data = try JSONEncoder().encode(value)
            
            if value["@type"] as? String == SOOwnershipInfo.type {
                return try JSONDecoder().decode(SOOwnershipInfo.self, from: data)
            } else if value["@type"] as? String == SOProduct.type {
                return try JSONDecoder().decode(SOProduct.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
