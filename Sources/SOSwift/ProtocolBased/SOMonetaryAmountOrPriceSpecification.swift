import Foundation
import SOSwiftVocabulary

public enum SOMonetaryAmountOrPriceSpecification: MonetaryAmountOrPriceSpecification, Codable {
    case monetaryAmount(value: SOMonetaryAmount)
    case priceSpecification(value: SOPriceSpecification)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOMonetaryAmount.type:
            let value = try container.decode(SOMonetaryAmount.self)
            self = .monetaryAmount(value: value)
        case SOPriceSpecification.type:
            let value = try container.decode(SOPriceSpecification.self)
            self = .priceSpecification(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .monetaryAmount(let value):
            try container.encode(value)
        case .priceSpecification(let value):
            try container.encode(value)
        }
    }
    
    public var monetaryAmount: SOMonetaryAmount? {
        switch self {
        case .monetaryAmount(let value):
            return value
        default:
            return nil
        }
    }
    
    public var priceSpecification: SOPriceSpecification? {
        switch self {
        case .priceSpecification(let value):
            return value
        default:
            return nil
        }
    }
}

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: MonetaryAmountOrPriceSpecification?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOMonetaryAmountOrPriceSpecification {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        if let typedValue = value as? SOMonetaryAmount {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPriceSpecification {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [MonetaryAmountOrPriceSpecification]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOMonetaryAmountOrPriceSpecification] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = self.nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOMonetaryAmount {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOPriceSpecification {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeMonetaryAmountOrPriceSpecificationIfPresent(forKey key: K) throws -> MonetaryAmountOrPriceSpecification? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOMonetaryAmountOrPriceSpecification.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeMonetaryAmountsOrPriceSpecificationsIfPresent(forKey key: K) throws -> [MonetaryAmountOrPriceSpecification]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOMonetaryAmountOrPriceSpecification].self, forKey: key)
        } catch {
            return nil
        }
    }
}
