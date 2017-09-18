import Foundation

public extension CreativeWorkOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOCreativeWork {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
