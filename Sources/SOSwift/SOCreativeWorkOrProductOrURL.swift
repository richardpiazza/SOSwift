import Foundation
import SOSwiftVocabulary

public enum SOCreativeWorkOrProductOrURL: CreativeWorkOrProductOrURL, Codable {
    case creativeWork(value: SOCreativeWork)
    case product(value: SOProduct)
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
        case SOCreativeWork.type:
            let value = try container.decode(SOCreativeWork.self)
            self = .creativeWork(value: value)
        case SOProduct.type:
            let value = try container.decode(SOProduct.self)
            self = .product(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .creativeWork(let value):
            try container.encode(value)
        case .product(let value):
            try container.encode(value)
        case .url(let value):
            try container.encode(value)
        }
    }
    
    public var creativeWork: CreativeWork? {
        switch self {
        case .creativeWork(let value):
            return value
        default:
            return nil
        }
    }
    
    public var product: Product? {
        switch self {
        case .product(let value):
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

public extension KeyedDecodingContainer {
    func decodeCreativeWorkOrProductOrURLIfPresent(forKey key: K) throws -> CreativeWorkOrProductOrURL? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOCreativeWorkOrProductOrURL.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeCreativeWorksOrProductsOrURLsIfPresent(forKey key: K) throws -> [CreativeWorkOrProductOrURL]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOCreativeWorkOrProductOrURL].self, forKey: key)
        } catch {
            return nil
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: CreativeWorkOrProductOrURL?, forKey key: K) throws {
        if let typedValue = value as? SOCreativeWorkOrProductOrURL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [CreativeWorkOrProductOrURL]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOCreativeWorkOrProductOrURL] {
            try self.encodeIfPresent(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOCreativeWork {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOProduct {
                try container.encode(typedValue)
            } else if let typedValue = object as? URL {
                try container.encode(typedValue)
            }
        })
    }
}
