import Foundation

public extension ContactPointOrPlace {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOContactPoint {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOPlace {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
