import Foundation

/// Used to describe membership in a loyalty programs (e.g. "StarAliance"), traveler clubs (e.g. "AAA"), purchase clubs ("Safeway Club"), etc.
public class SOProgramMembership: SOIntangible, ProgramMembership {
    override public class var type: String {
        return "ProgramMembership"
    }
    
    /// The organization (airline, travelers' club, etc.) the membership is made with.
    public var hostingOrganization: Organization?
    /// A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals. Supersedes members, musicGroupMember. Inverse property: memberOf.
    public var member: OrganizationOrPerson?
    /// A unique identifier for the membership.
    public var membershipNumber: String?
    /// The program providing the membership.
    public var programName: String?
}
