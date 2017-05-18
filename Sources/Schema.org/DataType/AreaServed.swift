import Foundation

/// AdministrativeArea, GeoShape, Place, Text
public protocol AreaServed {}

public extension AreaServed {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? AdministrativeArea {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? GeoShape {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Place {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: AreaServed {}
