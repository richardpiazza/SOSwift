import Foundation
import SOSwiftVocabulary

public extension PersonOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOPerson {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}
