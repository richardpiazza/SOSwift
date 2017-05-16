import Foundation

/// Boolean, Number, StructuredValue, Text
public protocol Value {}

public extension Value {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? String {
            return typedValue as AnyObject
        } else if let typedValue = self as? Bool {
            return typedValue as AnyObject
        } else if let typedValue = self as? Float {
            return typedValue as AnyObject
        } else if let typedValue = self as? Int {
            return typedValue as AnyObject
        } else if let typedValue = self as? StructuredValue {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}

extension Bool: Value {}

extension String: Value {}
