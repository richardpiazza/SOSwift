import Foundation
import SOSwiftVocabulary

public enum SOSoftwareApplicationOrWebsite: SoftwareApplicationOrWebsite, Codable {
    case softwareApplication(value: SOSoftwareApplication)
    case website(value: SOWebsite)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOSoftwareApplication.type:
            let value = try container.decode(SOSoftwareApplication.self)
            self = .softwareApplication(value: value)
        case SOWebsite.type:
            let value = try container.decode(SOWebsite.self)
            self = .website(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .softwareApplication(let value):
            try container.encode(value)
        case .website(let value):
            try container.encode(value)
        }
    }
    
    public var softwareApplication: SOSoftwareApplication? {
        switch self {
        case .softwareApplication(let value):
            return value
        default:
            return nil
        }
    }
    
    public var website: SOWebsite? {
        switch self {
        case .website(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: SoftwareApplicationOrWebsite?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOSoftwareApplicationOrWebsite {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOSoftwareApplication {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOWebsite {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [SoftwareApplicationOrWebsite]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? [SOSoftwareApplicationOrWebsite] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value.forEach({ (object) in
            if let typedValue = object as? SOSoftwareApplication {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOWebsite {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeSoftwareApplicationOrWebsiteIfPresent(forKey key: K) throws -> SoftwareApplicationOrWebsite? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOSoftwareApplicationOrWebsite.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeSoftwareApplicationsOrWebsitesIfPresent(forKey key: K) throws -> [SoftwareApplicationOrWebsite]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOSoftwareApplicationOrWebsite].self, forKey: key)
        } catch {
            return nil
        }
    }
}
