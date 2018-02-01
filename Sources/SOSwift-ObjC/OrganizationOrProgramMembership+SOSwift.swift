import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - OrganizationOrProgramMembership

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: OrganizationOrProgramMembership?, forKey key: K) throws {
        if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProgramMembership {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ values: [OrganizationOrProgramMembership]?, forKey key: K) throws {
        guard let values = values else {
            return
        }
        
        var subcontainer = self.nestedUnkeyedContainer(forKey: key)
        
        for value in values {
            if let typedValue = value as? SOOrganization {
                try subcontainer.encode(typedValue)
            } else if let typedValue = value as? SOProgramMembership {
                try subcontainer.encode(typedValue)
            }
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeOrganizationOrProgramMembershipIfPresent(forKey key: K) throws -> OrganizationOrProgramMembership? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOOrganization.type {
                return try self.decode(SOOrganization.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOProgramMembership.type {
                return try self.decode(SOProgramMembership.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `OrganizationOrProgramMembership` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodeOrganizationsOrProgramMembershipsIfPresent(forKey key: K) throws -> [OrganizationOrProgramMembership]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [OrganizationOrProgramMembership]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                    if dictionary[SOThing.Keywords.type] as? String == SOOrganization.type {
                        let decodable = try JSONDecoder().decode(SOOrganization.self, from: data)
                        decodables.append(decodable)
                    } else if dictionary[SOThing.Keywords.type] as? String == SOProgramMembership.type {
                        let decodable = try JSONDecoder().decode(SOProgramMembership.self, from: data)
                        decodables.append(decodable)
                    }
                }
            }
            
            return decodables
        } catch {
        }
        
        do {
            if let element = try self.decodeOrganizationOrProgramMembershipIfPresent(forKey: key) {
                return [element]
            }
        } catch {
        }
        
        print("Failed to decode `[OrganizationOrProgramMembership]` for key: \(key.stringValue).")
        
        return nil
    }
}
