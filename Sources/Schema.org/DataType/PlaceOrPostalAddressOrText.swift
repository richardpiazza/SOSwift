import Foundation

/// Place, PostalAddress, Text
public protocol PlaceOrPostalAddressOrText {}

public extension PlaceOrPostalAddressOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Place {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? PostalAddress {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: PlaceOrPostalAddressOrText {}
