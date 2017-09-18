import Foundation
import SOSwiftVocabulary

public extension AreaServed {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOAdministrativeArea {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOGeoShape {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOPlace {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
