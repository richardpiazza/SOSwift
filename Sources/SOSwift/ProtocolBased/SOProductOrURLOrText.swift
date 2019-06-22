import Foundation
import SOSwiftVocabulary

// MARK: - ProductOrURLOrText
public enum SOProductOrURLOrText: ProductOrURLOrText, Codable {
    case product(value: SOProduct)
    case url(value: URL)
    case text(value: String)
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            do {
                let value = try container.decode(URL.self)
                self = .url(value: value)
                return
            } catch {
                
            }
            
            let value = try container.decode(String.self)
            self = .text(value: value)
            return
        }
        
        guard let type = jsonDictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
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
        case .product(let value):
            try container.encode(value)
        case .url(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var product: SOProduct? {
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
    
    public var text: String? {
        switch self {
        case .text(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ProductOrURLOrText?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOProductOrURLOrText {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [ProductOrURLOrText]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? [SOProductOrURLOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value.forEach({ (object) in
            if let typedValue = object as? SOProduct {
                try container.encode(typedValue)
            } else if let typedValue = object as? URL {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

public extension KeyedDecodingContainer {
    func decodeProductOrURLOrTextIfPresent(forKey key: K) throws -> ProductOrURLOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOProductOrURLOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeProductsOrURLsOrTextsIfPresent(forKey key: K) throws -> [ProductOrURLOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOProductOrURLOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
