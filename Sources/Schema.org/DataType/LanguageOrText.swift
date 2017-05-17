import Foundation

/// Language, Text
public protocol LanguageOrText {}

public extension LanguageOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Language {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: LanguageOrText {}
