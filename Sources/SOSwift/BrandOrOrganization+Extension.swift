import Foundation
import SOSwiftVocabulary

// MARK: - BrandOrOrganization

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: BrandOrOrganization?, forKey key: K) throws {
        if let typedValue = value as? SOBrand {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ values: [BrandOrOrganization]?, forKey key: K) throws {
        guard let values = values else {
            return
        }
        
        var subcontainer = self.nestedUnkeyedContainer(forKey: key)
        
        for value in values {
            if let typedValue = value as? SOBrand {
                try subcontainer.encode(typedValue)
            } else if let typedValue = value as? SOOrganization {
                try subcontainer.encode(typedValue)
            }
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeBrandOrOrganizationIfPresent(forKey key: K) throws -> BrandOrOrganization? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOBrand.type {
                return try self.decode(SOBrand.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOOrganization.type {
                return try self.decode(SOOrganization.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `BrandOrOrganization` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodeBrandsOrOrganizationsIfPresent(forKey key: K) throws -> [BrandOrOrganization]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [BrandOrOrganization]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                    if dictionary[SOThing.Keywords.type] as? String == SOBrand.type {
                        let object = try JSONDecoder().decode(SOBrand.self, from: data)
                        decodables.append(object)
                    } else if dictionary[SOThing.Keywords.type] as? String == SOOrganization.type {
                        let object = try JSONDecoder().decode(SOOrganization.self, from: data)
                        decodables.append(object)
                    }
                }
            }
            
            return decodables
        } catch {
        }
        
        do {
            if let element = try self.decodeBrandOrOrganizationIfPresent(forKey: key) {
                return [element]
            }
        } catch {
        }
        
        print("Failed to decode `[BrandOrOrganization]` for key: \(key.stringValue).")
        
        return nil
    }
}
