import Foundation
import SOSwiftVocabulary

public extension ProductModelOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOProductModel {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
