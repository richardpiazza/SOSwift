import Foundation

/// Brand, Organization
public protocol BrandOrOrganization {}

public extension BrandOrOrganization {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Brand {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Organization {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
