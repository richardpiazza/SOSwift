import Foundation
import SOSwiftVocabulary

/// An organization such as a school, NGO, corporation, club, etc.
public class SOOrganization: SOThing, Organization {

    override public class var type: String {
        return "Organization"
    }
    
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// Alumni of an organization.
    /// Inverse property: alumniOf.
    public var alumni: [Person]?
    /// The geographic area where a service or offered item is provided.
    public var areaServed: AreaServed?
    /// An award won by or for this item
    public var award: [String]?
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    public var brand: [BrandOrOrganization]?
    /// A contact point for a person or organization.
    public var contactPoint: [ContactPoint]?
    /// A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.
    public var department: Organization?
    /// The date that this organization was dissolved.
    public var dissolutionDate: DateOnly?
    /// The Dun & Bradstreet DUNS number for identifying an organization or business person.
    public var duns: String?
    /// Email address.
    public var email: String?
    /// Someone working for this organization.
    public var employee: [Person]?
    /// Upcoming or past event associated with this place, organization, or action.
    public var event: [Event]?
    /// The fax number.
    public var faxNumber: String?
    /// A person who founded this organization.
    public var founder: [Person]?
    /// The date that this organization was founded.
    public var foundingDate: DateOnly?
    /// The place where the Organization was founded.
    public var foundingLocation: Place?
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    public var funder: OrganizationOrPerson?
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    public var globalLocationNumber: String?
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    public var hasOfferCatalog: OfferCatalog?
    /// Points-of-Sales operated by the organization or person.
    public var hasPOS: [Place]?
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
    public var isicV4: String?
    /// The official name of the organization, e.g. the registered company name.
    public var legalName: String?
    /// An organization identifier that uniquely identifies a legal entity as defined in ISO 17442.
    public var leiCode: String?
    /// The location of for example where the event is happening, an organization is located, or where an action takes place.
    public var location: PlaceOrPostalAddressOrText?
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    /// A pointer to products or services offered by the organization or person.
    /// Inverse property: offeredBy.
    public var makesOffers: [Offer]?
    /// A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.
    /// Inverse property: memberOf.
    public var member: [OrganizationOrPerson]?
    /// An Organization (or ProgramMembership) to which this Person or Organization belongs.
    /// Inverse property: member.
    public var memberOf: OrganizationOrProgramMembership?
    /// The North American Industry Classification System (NAICS) code for a particular organization or business person.
    public var naics: String?
    /// The number of employees in an organization e.g. business.
    public var numberOfEmployees: QuantitativeValue?
    /// Products owned by the organization or person.
    public var owns: [OwnershipInfoOrProduct]?
    /// The larger organization that this organization is a subOrganization of, if any.
    /// Inverse property: subOrganization.
    public var parentOrganization: Organization?
    /// A review of the item.
    public var review: [Review]?
    /// A pointer to products or services sought by the organization or person (demand).
    public var seeks: [Demand]?
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    /// A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific 'department' property.
    /// Inverse property: parentOrganization.
    public var subOrganization: Organization?
    /// The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
    public var taxID: String?
    /// The telephone number.
    public var telephone: String?
    /// The Value-added Tax ID of the organization or person.
    public var vatID: String?
    
    private enum CodingKeys: String, CodingKey {
        case address
        case aggregateRating
        case alumni
        case areaSurved
        case award
        case brand
        case contactPoint
        case department
        case dissolutionDate
        case duns
        case email
        case employee
        case event
        case faxNumber
        case founder
        case foundingDate
        case foundingLocation
        case funder
        case globalLocationNumber
        case hasOfferCatalog
        case hasPOS
        case isicV4
        case legalName
        case leiCode
        case location
        case logo
        case makesOffers
        case member
        case memberOf
        case naics
        case numberOfEmployees
        case owns
        case parentOrganization
        case review
        case seeks
        case sponsor
        case subOrganization
        case taxID
        case telephone
        case vatID
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
