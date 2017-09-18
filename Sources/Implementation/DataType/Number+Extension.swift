import Foundation

public extension Number {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Int {
            return typedValue as AnyObject
        } else if let typedValue = self as? Float {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
