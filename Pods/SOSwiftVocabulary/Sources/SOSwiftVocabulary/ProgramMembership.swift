import Foundation

public protocol ProgramMembershipConformance:
                    OrganizationOrProgramMembership
                {}

/// Used to describe membership in a loyalty programs (e.g. "StarAliance"), traveler clubs (e.g. "AAA"), purchase clubs ("Safeway Club"), etc.
public protocol ProgramMembership: Intangible, ProgramMembershipConformance {
    /// The organization (airline, travelers' club, etc.) the membership is made with.
    var hostingOrganization: Organization? { get set }
    /// A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.
    /// Inverse property: memberOf.
    /// - schema.org property name: member
    var members: [OrganizationOrPerson]? { get set }
    /// A unique identifier for the membership.
    var membershipNumber: String? { get set }
    /// The program providing the membership.
    var programName: String? { get set }
}
