import Foundation
import SOSwiftVocabulary

// MARK: - BrandOrOrganization

public extension KeyedEncodingContainer {
    public mutating func encodeBrandOrOrganization(_ value: BrandOrOrganization, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOBrand {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeBrandsOrOrganizations(_ values: [BrandOrOrganization], forKey key: KeyedEncodingContainer.Key) throws {
        var encodables = [Encodable]()
        
        for value in values {
            if let typedValue = value as? SOBrand {
                encodables.append(typedValue)
            } else if let typedValue = value as? SOOrganization {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
    }
}

public extension KeyedDecodingContainer {
    public func decodeBrandOrOrganizationIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> BrandOrOrganization? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOBrand.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOBrand.self, from: data)
            } else if value["@type"] as? String == SOOrganization.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOOrganization.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public func decodeBrandsOrOrganizationsIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> [BrandOrOrganization]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [BrandOrOrganization]()
        
        do {
            let values = try self.decode([[String : AnyObject]].self, forKey: key)
            for value in values {
                let data = try JSONEncoder().encode(value)
                
                if value["@type"] as? String == SOBrand.type {
                    let decodable = try JSONDecoder().decode(SOBrand.self, from: data)
                    decodables.append(decodable)
                } else if value["@type"] as? String == SOOrganization.type {
                    let decodable = try JSONDecoder().decode(SOOrganization.self, from: data)
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
