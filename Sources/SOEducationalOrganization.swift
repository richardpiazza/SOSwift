import Foundation
import SOSwiftVocabulary

/// An educational organization.
public class SOEducationalOrganization: SOOrganization, EducationalOrganization {
    
    public override class var type: String {
        return "EducationalOrganization"
    }
    
}
