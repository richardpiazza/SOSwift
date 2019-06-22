import Foundation
import SOSwiftVocabulary

public enum SOOrganizationOrProgramMembership: OrganizationOrProgramMembership, Codable {
    case organization(value: SOOrganization)
    case programMembership(value: SOProgramMembership)
    
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
        case SOProgramMembership.type:
            let value = try container.decode(SOProgramMembership.self)
            self = .programMembership(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .organization(let value):
            try container.encode(value)
        case .programMembership(let value):
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
    
    public var programMembership: SOProgramMembership? {
        switch self {
        case .programMembership(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: OrganizationOrProgramMembership?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOOrganizationOrProgramMembership {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProgramMembership {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [OrganizationOrProgramMembership]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        var container = self.nestedUnkeyedContainer(forKey: key)
        
        try value.forEach({ (object) in
            if let typedValue = object as? SOOrganization {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOProgramMembership {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeOrganizationOrProgramMembershipIfPresent(forKey key: K) throws -> OrganizationOrProgramMembership? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOOrganizationOrProgramMembership.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeOrganizationsOrProgramMembershipsIfPresent(forKey key: K) throws -> [OrganizationOrProgramMembership]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOOrganizationOrProgramMembership].self, forKey: key)
        } catch {
            return nil
        }
    }
}
