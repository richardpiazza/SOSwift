import Foundation

/// PostalAddress, Text
public protocol PostalAddressOrText {}

public extension PostalAddressOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? PostalAddress {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: PostalAddressOrText {}
