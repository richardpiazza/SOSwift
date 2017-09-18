import Foundation

public extension CreativeWorkOrProductOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOCreativeWork {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOProduct {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}
