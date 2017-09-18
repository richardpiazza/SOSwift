import Foundation

public extension LanguageOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOLanguage {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
