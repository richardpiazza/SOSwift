import Foundation

/// An educational organization.
public class EducationalOrganization: Organization, SchemaEducationalOrganization {
    override public class var type: String {
        return "EducationalOrganization"
    }
}
