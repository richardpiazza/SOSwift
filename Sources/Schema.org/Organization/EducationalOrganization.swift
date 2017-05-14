import Foundation

/// An educational organization.
public protocol EducationalOrganization: Organization {
    /// Alumni of an organization.
    /// Inverse property: alumniOf.
    var alumni: [Person]? { get set }
}
