import Foundation

/// ContactPoint, Place
public protocol ContactPointOrPlace {}

public extension ContactPointOrPlace {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? ContactPoint {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Place {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
