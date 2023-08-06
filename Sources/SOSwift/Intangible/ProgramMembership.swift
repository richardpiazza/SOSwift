import Foundation

/// Used to describe membership in a loyalty programs (e.g. "StarAliance"),
/// traveler clubs (e.g. "AAA"), purchase clubs ("Safeway Club"), etc.
public class ProgramMembership: Intangible {
    
    /// The organization (airline, travelers' club, etc.) the membership is made with.
    public var hostingOrganization: Organization?
    
    /// A member of an Organization or a ProgramMembership. Organizations
    /// can be members of organizations; ProgramMembership is typically for individuals.
    /// 
    /// - **Supersedes** _members_, _musicGroupMember_
    /// - **Inverse property**: _memberOf_
    public var members: [OrganizationOrPerson]?
    
    /// A unique identifier for the membership.
    public var membershipNumber: String?
    
    /// The program providing the membership.
    public var programName: String?
    
    internal enum ProgramMembershipCodingKeys: String, CodingKey {
        case hostingOrganization
        case members = "member"
        case membershipNumber
        case programName
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: ProgramMembershipCodingKeys.self)
        
        hostingOrganization = try container.decodeIfPresent(Organization.self, forKey: .hostingOrganization)
        members = try container.decodeIfPresent([OrganizationOrPerson].self, forKey: .members)
        membershipNumber = try container.decodeIfPresent(String.self, forKey: .membershipNumber)
        programName = try container.decodeIfPresent(String.self, forKey: .programName)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ProgramMembershipCodingKeys.self)
        
        try container.encodeIfPresent(hostingOrganization, forKey: .hostingOrganization)
        try container.encodeIfPresent(members, forKey: .members)
        try container.encodeIfPresent(membershipNumber, forKey: .membershipNumber)
        try container.encodeIfPresent(programName, forKey: .programName)
        
        try super.encode(to: encoder)
    }

}
