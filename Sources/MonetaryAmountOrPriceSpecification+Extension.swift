import Foundation
import SOSwiftVocabulary

// MARK: - MonetaryAmountOrPriceSpecification

public extension KeyedEncodingContainer {
    public mutating func encodeMonetaryAmountOrPriceSpecification(_ value: MonetaryAmountOrPriceSpecification, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOMonetaryAmount {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPriceSpecification {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeMonetaryAmountOrPriceSpecificationIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> MonetaryAmountOrPriceSpecification? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOMonetaryAmount.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOMonetaryAmount.self, from: data)
            } else if value["@type"] as? String == SOPriceSpecification.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOPriceSpecification.self, from: data)
            }
        } catch {
        }
        
        return nil
    }
}
