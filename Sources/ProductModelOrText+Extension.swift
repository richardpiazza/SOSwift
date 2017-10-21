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
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOProductModel.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOProductModel.self, from: data)
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
