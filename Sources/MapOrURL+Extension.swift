import Foundation
import SOSwiftVocabulary

public extension MapOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOMap {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}
