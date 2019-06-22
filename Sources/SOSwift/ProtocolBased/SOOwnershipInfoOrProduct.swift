import Foundation
import SOSwiftVocabulary

public enum SOOwnershipInfoOrProduct: OwnershipInfoOrProduct, Codable {
    case ownershipInfo(value: SOOwnershipInfo)
    case product(value: SOProduct)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOOwnershipInfo.type:
            let value = try container.decode(SOOwnershipInfo.self)
            self = .ownershipInfo(value: value)
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
        case .ownershipInfo(let value):
            try container.encode(value)
        case .product(let value):
            try container.encode(value)
        }
    }
    
    public var ownershipInfo: SOOwnershipInfo? {
        switch self {
        case .ownershipInfo(let value):
            return value
        default:
            return nil
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
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: OwnershipInfoOrProduct?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOOwnershipInfoOrProduct {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOOwnershipInfo {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [OwnershipInfoOrProduct]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? [SOOwnershipInfoOrProduct] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = self.nestedUnkeyedContainer(forKey: key)
        
        try value.forEach { (object) in
            if let typedValue = object as? SOOwnershipInfo {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOProduct {
                try container.encode(typedValue)
            }
        }
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeOwnershipInfoOrProductIfPresent(forKey key: K) throws -> OwnershipInfoOrProduct? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOOwnershipInfoOrProduct.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeOwnershipInfosOrProductsIfPresent(forKey key: K) throws -> [OwnershipInfoOrProduct]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOOwnershipInfoOrProduct].self, forKey: key)
        } catch {
            return nil
        }
    }
}
