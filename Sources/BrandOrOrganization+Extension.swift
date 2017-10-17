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
        }
        
        return nil
    }
}
