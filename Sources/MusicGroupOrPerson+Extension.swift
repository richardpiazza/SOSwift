import Foundation
import SOSwiftVocabulary

public extension MusicGroupOrPerson {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOMusicGroup {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOPerson {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
