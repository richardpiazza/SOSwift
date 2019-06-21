import Foundation
import SOSwiftVocabulary

public enum SOMusicGroupOrPerson: MusicGroupOrPerson, Codable {
    case musicGroup(value: SOMusicGroup)
    case person(value: SOPerson)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOMusicGroup.type:
            let value = try container.decode(SOMusicGroup.self)
            self = .musicGroup(value: value)
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
        case .musicGroup(let value):
            try container.encode(value)
        case .person(let value):
            try container.encode(value)
        }
    }
    
    public var musicGroup: SOMusicGroup? {
        switch self {
        case .musicGroup(let value):
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
    mutating func encodeIfPresent(_ value: MusicGroupOrPerson?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOMusicGroupOrPerson {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOMusicGroup {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [MusicGroupOrPerson]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOMusicGroupOrPerson] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = self.nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOMusicGroup {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOPerson {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeMusicGroupOrPersonIfPresent(forKey key: K) throws -> MusicGroupOrPerson? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOMusicGroupOrPerson.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeMusicGroupsOrPersonsIfPresent(forKey key: K) throws -> [MusicGroupOrPerson]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOMusicGroupOrPerson].self, forKey: key)
        } catch {
            return nil
        }
    }
}
