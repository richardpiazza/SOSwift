import Foundation
import SOSwiftVocabulary

public enum SOOrganizationOrPerson: OrganizationOrPerson, Codable {
    case organization(value: SOOrganization)
    case person(value: SOPerson)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOOrganization.type:
            let value = try container.decode(SOOrganization.self)
            self = .organization(value: value)
        case SOPerson.type:
            let value = try container.decode(SOPerson.self)
            self = .person(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .organization(let value):
            try container.encode(value)
        case .person(let value):
            try container.encode(value)
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
    
    public var person: SOPerson? {
        switch self {
        case .person(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: OrganizationOrPerson?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOOrganizationOrPerson {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [OrganizationOrPerson]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOOrganizationOrPerson] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = self.nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOOrganization {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOPerson {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeOrganizationOrPersonIfPresent(forKey key: K) throws -> OrganizationOrPerson? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOOrganizationOrPerson.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeOrganizationsOrPersonsIfPresent(forKey key: K) throws -> [OrganizationOrPerson]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOOrganizationOrPerson].self, forKey: key)
        } catch {
            return nil
        }
    }
}
