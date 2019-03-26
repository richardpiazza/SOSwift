import Foundation
import SOSwiftVocabulary

// MARK: - OrganizationOrPerson

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: OrganizationOrPerson?, forKey key: K) throws {
        if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ values: [OrganizationOrPerson]?, forKey key: K) throws {
        guard let values = values else {
            return
        }
        
        var subcontainer = self.nestedUnkeyedContainer(forKey: key)
        
        for value in values {
            if let typedValue = value as? SOOrganization {
                try subcontainer.encode(typedValue)
            } else if let typedValue = value as? SOPerson {
                try subcontainer.encode(typedValue)
            }
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeOrganizationOrPersonIfPresent(forKey key: K) throws -> OrganizationOrPerson? {
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
    
    func decodeOrganizationsOrPersonsIfPresent(forKey key: K) throws -> [OrganizationOrPerson]? {
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
        
        do {
            if let element = try self.decodeOrganizationOrPersonIfPresent(forKey: key) {
                return [element]
            }
        } catch {
        }
        
        print("Failed to decode `[OrganizationOrPerson]` for key: \(key.stringValue).")
        
        return nil
    }
}
