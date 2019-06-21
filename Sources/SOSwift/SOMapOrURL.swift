import Foundation
import SOSwiftVocabulary

public enum SOMapOrURL: MapOrURL, Codable {
    case map(value: SOMap)
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
        case SOMap.type:
            let value = try container.decode(SOMap.self)
            self = .map(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .map(let value):
            try container.encode(value)
        case .url(let value):
            try container.encode(value)
        }
    }
    
    public var map: SOMap? {
        switch self {
        case .map(let value):
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
    mutating func encodeIfPresent(_ value: MapOrURL?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOMapOrURL {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOMap {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [MapOrURL]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOMapOrURL] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOMap {
                try container.encode(typedValue)
            } else if let typedValue = object as? URL {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeMapOrURLIfPresent(forKey key: K) throws -> MapOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOMapOrURL.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeMapsOrURLsIfPresent(forKey key: K) throws -> [MapOrURL]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOMapOrURL].self, forKey: key)
        } catch {
            return nil
        }
    }
}
