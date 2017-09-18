import Foundation

public extension OrganizationOrProgramMembership {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOOrganization {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOProgramMembership {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
