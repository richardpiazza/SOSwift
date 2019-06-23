import Foundation

/// Used to describe membership in a loyalty programs (e.g. "StarAliance"),
/// traveler clubs (e.g. "AAA"), purchase clubs ("Safeway Club"), etc.
public class ProgramMembership: Intangible {
    
    /// The organization (airline, travelers' club, etc.) the membership is made with.
    public var hostingOrganization: Organization?
    
    /// A member of an Organization or a ProgramMembership. Organizations
    /// can be members of organizations; ProgramMembership is typically for i
    /// ndividuals.
    /// - **Supersedes** _members_, _musicGroupMember_
    /// - **Inverse property**: _memberOf_
    public var members: [OrganizationOrPerson]?
    
    /// A unique identifier for the membership.
    public var membershipNumber: String?
    
    /// The program providing the membership.
    public var programName: String?
    
    private enum CodingKeys: String, CodingKey {
        case hostingOrganization
        case members = "member"
        case membershipNumber
        case programName
    }
    
}
