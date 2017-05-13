import Foundation

/// An educational organization.
public class EducationalOrganization: Organization, SchemaEducationalOrganization {
    override public var type: String {
        return "EducationalOrganization"
    }
}
