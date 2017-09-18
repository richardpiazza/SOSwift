import Foundation
import SOSwiftVocabulary

public extension GeoCoordinatesOrGeoShape {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOGeoCoordinates {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOGeoShape {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
