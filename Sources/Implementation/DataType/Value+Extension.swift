import Foundation

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
        } else if let typedValue = self as? SOStructuredValue {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
