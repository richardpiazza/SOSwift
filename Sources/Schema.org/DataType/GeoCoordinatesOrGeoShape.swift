import Foundation

/// GeoCoordinates, GeoShape
public protocol GeoCoordinatesOrGeoShape {}

public extension GeoCoordinatesOrGeoShape {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? GeoCoordinates {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? GeoShape {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
