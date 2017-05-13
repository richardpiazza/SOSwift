import Foundation

public protocol SchemaProgramMembership: SchemaIntangible, SchemaOrganizationOrProgramMembership {
    var hostingOrganization: SchemaOrganization? { get set }
    var member: SchemaOrganizationOrPerson? { get set }
    var membershipNumber: String? { get set }
    var programName: String? { get set }
}
