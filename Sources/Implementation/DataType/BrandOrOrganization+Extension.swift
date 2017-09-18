import Foundation

public extension BrandOrOrganization {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOBrand {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOOrganization {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
