import Foundation

public protocol ProgramMembershipConformance:
                    OrganizationOrProgramMembership
                {}

public protocol ProgramMembership: Intangible, ProgramMembershipConformance {
    var hostingOrganization: Organization? { get set }
    var member: OrganizationOrPerson? { get set }
    var membershipNumber: String? { get set }
    var programName: String? { get set }
}
