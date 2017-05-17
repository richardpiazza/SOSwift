import Foundation

/// Distance, QuantitativeValue
public protocol DistanceOrQuantitativeValue {}

public extension DistanceOrQuantitativeValue {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Distance {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? QuantitativeValue {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
