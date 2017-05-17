import Foundation

/// Organization, Person
public protocol OrganizationOrPerson {}

public extension OrganizationOrPerson {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Organization {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Person {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
