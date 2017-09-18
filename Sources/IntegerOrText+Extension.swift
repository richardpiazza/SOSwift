import Foundation
import SOSwiftVocabulary

public extension IntegerOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Int {
            return typedValue as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
