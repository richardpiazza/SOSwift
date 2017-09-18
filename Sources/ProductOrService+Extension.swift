import Foundation
import SOSwiftVocabulary

public extension ProductOrService {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOProduct {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOService {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
