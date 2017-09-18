import Foundation
import SOSwiftVocabulary

public extension ImageObjectOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOImageObject {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}
