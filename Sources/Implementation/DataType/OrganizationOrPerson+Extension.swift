import Foundation

public extension OrganizationOrPerson {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOOrganization {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOPerson {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
