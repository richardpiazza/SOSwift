import Foundation

/// Product, Service
public protocol ProductOrService {}

public extension ProductOrService {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Product {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Service {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
