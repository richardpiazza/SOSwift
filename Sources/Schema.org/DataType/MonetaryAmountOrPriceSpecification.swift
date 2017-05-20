import Foundation

/// MonetaryAmount, PriceSpecification
public protocol MonetaryAmountOrPriceSpecification {}

public extension MonetaryAmountOrPriceSpecification {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? MonetaryAmount {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? PriceSpecification {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
