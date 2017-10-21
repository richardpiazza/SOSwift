import Foundation
import SOSwiftVocabulary

// MARK: - OwnershipInfoOrProduct

public extension KeyedEncodingContainer {
    public mutating func encodeOwnershipInfoOrProduct(_ value: OwnershipInfoOrProduct, forKey key: K) throws {
        if let typedValue = value as? SOOwnershipInfo {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeOwnershipInfosOrProducts(_ values: [OwnershipInfoOrProduct], forKey key: K) throws {
        var encodables = [Encodable]()
        
        for value in values {
            if let typedValue = value as? SOOwnershipInfo {
                encodables.append(typedValue)
            } else if let typedValue = value as? SOProduct {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
    }
}

public extension KeyedDecodingContainer {
    public func decodeOwnershipInfoOrProductIfPresent(forKey key: K) throws -> OwnershipInfoOrProduct? {
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
    
    public func decodeOwnershipInfosOrProductsIfPresent(forKey key: K) throws -> [OwnershipInfoOrProduct]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [OwnershipInfoOrProduct]()
        
        do {
            let values = try self.decode([[String : AnyObject]].self, forKey: key)
            for value in values {
                let data = try JSONEncoder().encode(value)
                
                if value["@type"] as? String == SOOwnershipInfo.type {
                    let decodable = try JSONDecoder().decode(SOOwnershipInfo.self, from: data)
                    decodables.append(decodable)
                } else if value["@type"] as? String == SOProduct.type {
                    let decodable = try JSONDecoder().decode(SOProduct.self, from: data)
                    decodables.append(decodable)
                }
            }
            
            return decodables
        } catch {
            print(error)
        }
        
        return nil
    }
}
