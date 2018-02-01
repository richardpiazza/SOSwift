import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - OwnershipInfoOrProduct

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: OwnershipInfoOrProduct?, forKey key: K) throws {
        if let typedValue = value as? SOOwnershipInfo {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ values: [OwnershipInfoOrProduct]?, forKey key: K) throws {
        guard let values = values else {
            return
        }
        
        var subcontainer = self.nestedUnkeyedContainer(forKey: key)
        
        for value in values {
            if let typedValue = value as? SOOwnershipInfo {
                try subcontainer.encode(typedValue)
            } else if let typedValue = value as? SOProduct {
                try subcontainer.encode(typedValue)
            }
        }
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
        
        do {
            if let element = try self.decodeOwnershipInfoOrProductIfPresent(forKey: key) {
                return [element]
            }
        } catch {
        }
        
        print("Failed to decode `[OrganizationOrProgramMembership]` for key: \(key.stringValue).")
        
        return nil
    }
}
