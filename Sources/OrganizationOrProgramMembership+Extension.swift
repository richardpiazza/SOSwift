import Foundation
import SOSwiftVocabulary

// MARK: - OrganizationOrProgramMembership

public extension KeyedEncodingContainer {
    public mutating func encodeOrganizationOrProgramMembership(_ value: OrganizationOrProgramMembership, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProgramMembership {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeOrganizationOrProgramMembershipIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> OrganizationOrProgramMembership? {
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
}
