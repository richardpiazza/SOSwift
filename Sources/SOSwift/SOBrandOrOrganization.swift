import Foundation
import SOSwiftVocabulary

/// The default decoded value for a `BrandOrOrganization`.
public enum SOBrandOrOrganization: BrandOrOrganization, Codable {
    case brand(value: SOBrand)
    case organization(value: SOOrganization)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOBrand.type:
            let value = try container.decode(SOBrand.self)
            self = .brand(value: value)
        case SOOrganization.type:
            let value = try container.decode(SOOrganization.self)
            self = .organization(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .brand(let value):
            try container.encode(value)
        case .organization(let value):
            try container.encode(value)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeBrandOrOrganizationIfPresent(forKey key: K) throws -> BrandOrOrganization? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOBrandOrOrganization.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeBrandsOrOrganizationsIfPresent(forKey key: K) throws -> [BrandOrOrganization]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOBrandOrOrganization].self, forKey: key)
        } catch {
            return nil
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: BrandOrOrganization?, forKey key: K) throws {
        if let typedValue = value as? SOBrandOrOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOBrand {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }

    mutating func encodeIfPresent(_ value: [BrandOrOrganization]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOBrandOrOrganization] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOBrand {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOOrganization {
                try container.encode(typedValue)
            }
        })
    }
}
