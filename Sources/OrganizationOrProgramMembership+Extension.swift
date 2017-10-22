import Foundation
import SOSwiftVocabulary

// MARK: - OrganizationOrProgramMembership

public extension KeyedEncodingContainer {
    public mutating func encodeOrganizationOrProgramMembership(_ value: OrganizationOrProgramMembership, forKey key: K) throws {
        if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProgramMembership {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeOrganizationsOrProgramMemberships(_ values: [OrganizationOrProgramMembership], forKey key: K) throws {
        var encodables = [Encodable]()
        
        for value in values {
            if let typedValue = value as? SOOrganization {
                encodables.append(typedValue)
            } else if let typedValue = value as? SOProgramMembership {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
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
        
        print("Failed to decode `[OrganizationOrProgramMembership]` for key: \(key.stringValue).")
        
        return nil
    }
}
