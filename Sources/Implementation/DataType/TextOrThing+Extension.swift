import Foundation

public extension TextOrThing {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOThing {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
