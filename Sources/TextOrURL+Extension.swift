import Foundation
import SOSwiftVocabulary

public extension TextOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
