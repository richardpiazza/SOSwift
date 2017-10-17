import Foundation
import SOSwiftVocabulary

// MARK: - CreativeWorkOrProductOrURL

public extension KeyedEncodingContainer {
    public mutating func encodeCreativeWorkOrProductOrURL(_ value: CreativeWorkOrProductOrURL, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeCreativeWorkOrProductOrURLIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> CreativeWorkOrProductOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOCreativeWork.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOCreativeWork.self, from: data)
            } else if value["@type"] as? String == SOProduct.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOProduct.self, from: data)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            return value
        } catch {
        }
        
        return nil
    }
}
