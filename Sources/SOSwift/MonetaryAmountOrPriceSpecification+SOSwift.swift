import Foundation
import SOSwiftVocabulary

// MARK: - MonetaryAmountOrPriceSpecification

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MonetaryAmountOrPriceSpecification?, forKey key: K) throws {
        if let typedValue = value as? SOMonetaryAmount {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPriceSpecification {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeMonetaryAmountOrPriceSpecificationIfPresent(forKey key: K) throws -> MonetaryAmountOrPriceSpecification? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOMonetaryAmount.type {
                return try self.decode(SOMonetaryAmount.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOPriceSpecification.type {
                return try self.decode(SOPriceSpecification.self, forKey: key)
            }
        } catch {
        }
        
        print("Failed to decode `MonetaryAmountOrPriceSpecification` for key: \(key.stringValue).")
        
        return nil
    }
}
