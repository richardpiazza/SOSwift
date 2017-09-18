import Foundation
import SOSwiftVocabulary

public extension ValueReference {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOEnumeration {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOStructuredValue {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
