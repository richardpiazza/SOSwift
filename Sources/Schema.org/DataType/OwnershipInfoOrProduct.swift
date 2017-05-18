import Foundation

/// OwnershipInfo, Product
public protocol OwnershipInfoOrProduct {}

public extension OwnershipInfoOrProduct {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? OwnershipInfo {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Product {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
