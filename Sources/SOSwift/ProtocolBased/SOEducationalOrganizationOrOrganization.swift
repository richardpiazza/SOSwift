import Foundation
import SOSwiftVocabulary

public enum SOEducationalOrganizationOrOrganization: EducationalOrganizationOrOrganization, Codable {
    case educationalOrganization(value: SOEducationalOrganization)
    case organization(value: SOOrganization)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOEducationalOrganization.type:
            let value = try container.decode(SOEducationalOrganization.self)
            self = .educationalOrganization(value: value)
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
        case .educationalOrganization(let value):
            try container.encode(value)
        case .organization(let value):
            try container.encode(value)
        }
    }
    
    public var educationalOrganization: SOEducationalOrganization? {
        switch self {
        case .educationalOrganization(let value):
            return value
        default:
            return nil
        }
    }
    
    public var organization: SOOrganization? {
        switch self {
        case .organization(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: EducationalOrganizationOrOrganization?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOEducationalOrganizationOrOrganization {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOEducationalOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [EducationalOrganizationOrOrganization]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOEducationalOrganizationOrOrganization] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOEducationalOrganization {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOOrganization {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeEducationalOrganizationOrOrganizationIfPresent(forKey key: K) throws -> EducationalOrganizationOrOrganization? {
        guard contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOEducationalOrganizationOrOrganization.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeEducationalOrganizationsOrOrganizationsIfPresent(forKey key: K) throws -> [SOEducationalOrganizationOrOrganization]? {
        guard contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOEducationalOrganizationOrOrganization].self, forKey: key)
        } catch {
            return nil
        }
    }
}
