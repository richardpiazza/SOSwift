import Foundation
import SOSwiftVocabulary

public extension EducationalOrganizationOrOrganization {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? SOEducationalOrganization {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? SOOrganization {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
