import Foundation

public extension MonetaryAmountOrPriceSpecification {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOMonetaryAmount {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOPriceSpecification {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
