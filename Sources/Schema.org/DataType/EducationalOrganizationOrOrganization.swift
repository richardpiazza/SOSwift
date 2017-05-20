import Foundation

/// EducationalOrganization, Organization
public protocol EducationalOrganizationOrOrganization {}

public extension EducationalOrganizationOrOrganization {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? EducationalOrganization {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Organization {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
