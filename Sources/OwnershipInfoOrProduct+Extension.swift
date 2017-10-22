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
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOOwnershipInfo.type {
                return try self.decode(SOOwnershipInfo.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOProduct.type {
                return try self.decode(SOProduct.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `OrganizationOrProgramMembership` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodeOwnershipInfosOrProductsIfPresent(forKey key: K) throws -> [OwnershipInfoOrProduct]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [OwnershipInfoOrProduct]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    let data = try JSONSerialization.data(withJSONObject: element, options: JSONSerialization.WritingOptions())
                    if dictionary[SOThing.Keywords.type] as? String == SOOwnershipInfo.type {
                        let decodable = try JSONDecoder().decode(SOOwnershipInfo.self, from: data)
                        decodables.append(decodable)
                    } else if dictionary[SOThing.Keywords.type] as? String == SOProduct.type {
                        let decodable = try JSONDecoder().decode(SOProduct.self, from: data)
                        decodables.append(decodable)
                    }
                }
            }
            
            return decodables
        } catch {
        }
        
        print("Failed to decode `[OrganizationOrProgramMembership]` for key: \(key.stringValue).")
        
        return nil
    }
}
