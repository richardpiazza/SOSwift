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
            let value = try self.decode([String : AnyObject].self, forKey: key)
            let data = try JSONEncoder().encode(value)
            
            if value["@type"] as? String == SOOrganization.type {
                return try JSONDecoder().decode(SOOrganization.self, from: data)
            } else if value["@type"] as? String == SOProgramMembership.type {
                return try JSONDecoder().decode(SOProgramMembership.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public func decodeOrganizationsOrProgramMembershipsIfPresent(forKey key: K) throws -> [OrganizationOrProgramMembership]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [OrganizationOrProgramMembership]()
        
        do {
            let values = try self.decode([[String : AnyObject]].self, forKey: key)
            for value in values {
                let data = try JSONEncoder().encode(value)
                
                if value["@type"] as? String == SOOrganization.type {
                    let decodable = try JSONDecoder().decode(SOOrganization.self, from: data)
                    decodables.append(decodable)
                } else if value["@type"] as? String == SOProgramMembership.type {
                    let decodable = try JSONDecoder().decode(SOProgramMembership.self, from: data)
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
