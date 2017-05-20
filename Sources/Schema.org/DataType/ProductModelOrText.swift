import Foundation

/// ProductModel, Text
public protocol ProductModelOrText {}

public extension ProductModelOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? ProductModel {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: ProductModelOrText {}
