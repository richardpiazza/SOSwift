import Foundation

/// Organization, ProgramMembership
public protocol OrganizationOrProgramMembership {}

public extension OrganizationOrProgramMembership {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Organization {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? ProgramMembership {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
