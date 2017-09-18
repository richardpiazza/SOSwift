import Foundation

public extension DistanceOrQuantitativeValue {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SODistance {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOQuantitativeValue {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
