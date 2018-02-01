import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - EducationalOrganizationOrOrganization

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: EducationalOrganizationOrOrganization?, forKey key: K) throws {
        if let typedValue = value as? SOEducationalOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeEducationalOrganizationOrOrganizationIfPresent(forKey key: K) throws -> EducationalOrganizationOrOrganization? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOEducationalOrganization.type {
                return try self.decode(SOEducationalOrganization.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOOrganization.type {
                return try self.decode(SOOrganization.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `EducationalOrganizationOrOrganization` for key: \(key.stringValue).")
        
        return nil
    }
}
