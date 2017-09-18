import Foundation

public extension OwnershipInfoOrProduct {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOOwnershipInfo {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOProduct {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
