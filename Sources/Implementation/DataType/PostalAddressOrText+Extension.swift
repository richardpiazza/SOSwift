import Foundation

public extension PostalAddressOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOPostalAddress {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}
