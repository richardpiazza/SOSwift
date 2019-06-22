import Foundation
import SOSwiftVocabulary

public enum SOPersonOrURL: PersonOrURL, Codable {
    case person(value: SOPerson)
    case url(value: URL)
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(URL.self)
            self = .url(value: value)
            return
        }
        
        guard let type = jsonDictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
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
        case .person(let value):
            try container.encode(value)
        case .url(let value):
            try container.encode(value)
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
    
    public var url: URL? {
        switch self {
        case .url(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: PersonOrURL?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOPersonOrURL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [PersonOrURL]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? [SOPersonOrURL] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = self.nestedUnkeyedContainer(forKey: key)
        
        try value.forEach { (object) in
            if let typedValue = object as? SOPerson {
                try container.encode(typedValue)
            } else if let typedValue = object as? URL {
                try container.encode(typedValue)
            }
        }
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodePersonOrURLIfPresent(forKey key: K) throws -> PersonOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOPersonOrURL.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodePersonsOrURLsIfPresent(forKey key: K) throws -> [PersonOrURL]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOPersonOrURL].self, forKey: key)
        } catch {
            return nil
        }
    }
}
