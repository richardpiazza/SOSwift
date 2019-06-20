import Foundation
import SOSwiftVocabulary

public enum SOImageObjectOrPhotograph: ImageObjectOrPhotograph, Codable {
    case imageObject(value: SOImageObject)
    case photograph(value: SOPhotograph)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOImageObject.type:
            let value = try container.decode(SOImageObject.self)
            self = .imageObject(value: value)
        case SOPhotograph.type:
            let value = try container.decode(SOPhotograph.self)
            self = .photograph(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .imageObject(let value):
            try container.encode(value)
        case .photograph(let value):
            try container.encode(value)
        }
    }
    
    public var imageObject: SOImageObject? {
        switch self {
        case .imageObject(let value):
            return value
        default:
            return nil
        }
    }
    
    public var photograph: SOPhotograph? {
        switch self {
        case .photograph(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ImageObjectOrPhotograph?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOImageObjectOrPhotograph {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOImageObject {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPhotograph {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [ImageObjectOrPhotograph]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOImageObjectOrPhotograph] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = self.nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOImageObject {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOPhotograph {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeImageObjectOrPhotographIfPresent(forKey key: K) throws -> ImageObjectOrPhotograph? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOImageObjectOrPhotograph.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeImageObjectsOrPhotographsIfPresent(forKey key: K) throws -> [ImageObjectOrPhotograph]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOImageObjectOrPhotograph].self, forKey: key)
        } catch {
            return nil
        }
    }
}
