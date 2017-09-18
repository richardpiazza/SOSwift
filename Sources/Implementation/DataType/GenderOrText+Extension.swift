import Foundation

public extension GenderOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Gender {
            return typedValue.rawValue as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
