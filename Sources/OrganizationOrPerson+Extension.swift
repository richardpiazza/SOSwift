import Foundation
import SOSwiftVocabulary

// MARK: - OrganizationOrPerson

public extension KeyedEncodingContainer {
    public mutating func encodeOrganizationOrPerson(_ value: OrganizationOrPerson, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeOrganizationsOrPersons(_ value: [OrganizationOrPerson], forKey key: KeyedEncodingContainer.Key) throws {
        var encodables = [Encodable]()
        
        for element in value {
            if let typedValue = element as? SOOrganization {
                encodables.append(typedValue)
            } else if let typedValue = element as? SOPerson {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
    }
}

public extension KeyedDecodingContainer {
    public func decodeOrganizationOrPersonIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> OrganizationOrPerson? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            let data = try JSONEncoder().encode(value)
            
            if value["@type"] as? String == SOOrganization.type {
                return try JSONDecoder().decode(SOOrganization.self, from: data)
            } else if value["@type"] as? String == SOPerson.type {
                return try JSONDecoder().decode(SOPerson.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public func decodeOrganizationsOrPersonsIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> [OrganizationOrPerson]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [OrganizationOrPerson]()
        
        do {
            let values = try self.decode([[String : AnyObject]].self, forKey: key)
            
            for value in values {
                let data = try JSONEncoder().encode(value)
                
                if value["@type"] as? String == SOOrganization.type {
                    let decodable = try JSONDecoder().decode(SOOrganization.self, from: data)
                    decodables.append(decodable)
                } else if value["@type"] as? String == SOPerson.type {
                    let decodable = try JSONDecoder().decode(SOPerson.self, from: data)
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
