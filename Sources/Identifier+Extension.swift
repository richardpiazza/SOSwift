import Foundation
import SOSwiftVocabulary

public extension Identifier {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOPropertyValue {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
