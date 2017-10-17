import Foundation
import SOSwiftVocabulary

/// An educational organization.
public class SOEducationalOrganization: SOOrganization, EducationalOrganization {
    override public class var type: String {
        return "EducationalOrganization"
    }
}