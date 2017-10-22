import Foundation
import SOSwiftVocabulary

// MARK: - OrganizationOrPerson

public extension KeyedEncodingContainer {
    public mutating func encodeOrganizationOrPerson(_ value: OrganizationOrPerson, forKey key: K) throws {
        if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeOrganizationsOrPersons(_ value: [OrganizationOrPerson], forKey key: K) throws {
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
    public func decodeOrganizationOrPersonIfPresent(forKey key: K) throws -> OrganizationOrPerson? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOOrganization.type {
                return try self.decode(SOOrganization.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOPerson.type {
                return try self.decode(SOPerson.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `OrganizationOrPerson` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodeOrganizationsOrPersonsIfPresent(forKey key: K) throws -> [OrganizationOrPerson]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [OrganizationOrPerson]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                    if dictionary[SOThing.Keywords.type] as? String == SOOrganization.type {
                        let decodable = try JSONDecoder().decode(SOOrganization.self, from: data)
                        decodables.append(decodable)
                    } else if dictionary[SOThing.Keywords.type] as? String == SOPerson.type {
                        let decodable = try JSONDecoder().decode(SOPerson.self, from: data)
                        decodables.append(decodable)
                    }
                }
            }
            
            return decodables
        } catch {
        }
        
        print("Failed to decode `[OrganizationOrPerson]` for key: \(key.stringValue).")
        
        return nil
    }
}
