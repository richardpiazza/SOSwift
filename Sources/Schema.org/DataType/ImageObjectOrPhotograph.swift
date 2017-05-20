import Foundation

/// ImageObject, Photograph
public protocol ImageObjectOrPhotograph {}

public extension ImageObjectOrPhotograph {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? ImageObject {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Photograph {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
