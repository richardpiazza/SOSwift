import Foundation

public protocol SchemaProgramMembership: Intangible, OrganizationOrProgramMembership {
    var hostingOrganization: SchemaOrganization? { get set }
    var member: OrganizationOrPerson? { get set }
    var membershipNumber: String? { get set }
    var programName: String? { get set }
}
