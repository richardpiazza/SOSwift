import Foundation
import SOSwiftVocabulary

public extension ImageObjectOrPhotograph {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOImageObject {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOPhotograph {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
