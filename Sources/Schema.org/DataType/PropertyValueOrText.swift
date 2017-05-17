import Foundation

/// PropertyValue, Text
public protocol PropertyValueOrText {}

public extension PropertyValueOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? PropertyValue {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: PropertyValueOrText {}
