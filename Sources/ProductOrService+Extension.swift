import Foundation
import SOSwiftVocabulary

// MARK: - ProductOrService

public extension KeyedEncodingContainer {
    public mutating func encodeProductOrService(_ value: ProductOrService, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOService {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeProductOrServiceIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> ProductOrService? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOProduct.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOProduct.self, from: data)
            } else if value["@type"] as? String == SOService.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOService.self, from: data)
            }
        } catch {
        }
        
        return nil
    }
}
