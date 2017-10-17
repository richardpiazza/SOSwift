import Foundation
import SOSwiftVocabulary

// MARK: - EducationalOrganizationOrOrganization

public extension KeyedEncodingContainer {
    public mutating func encodeEducationalOrganizationOrOrganization(_ value: EducationalOrganizationOrOrganization, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOEducationalOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeEducationalOrganizationOrOrganizationIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> EducationalOrganizationOrOrganization? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOEducationalOrganization.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOEducationalOrganization.self, from: data)
            } else if value["@type"] as? String == SOOrganization.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOOrganization.self, from: data)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
