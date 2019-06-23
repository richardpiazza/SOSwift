import Foundation

public class Person: Thing {
    
    /// An additional name for a Person, can be used for a middle name.
    public var additionalName: String?
    
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    
    /// An organization that this person is affiliated with. For example, a
    /// school/university, a club, or a team.
    public var affiliation: Organization?
    
    /// An organization that the person is an alumni of.
    /// - **Inverse property**: _alumni_
    public var alumniOf: EducationalOrganizationOrOrganization?
    
    /// An award won by or for this item.
    public var awards: [String]?
    
    /// Date of birth.
    public var birthDate: DateOnly?
    
    /// The place where the person was born.
    public var birthPlace: Place?
    
    /// The brand(s) associated with a product or service, or the brand(s)
    /// maintained by an organization or business person.
    public var brands: [BrandOrOrganization]?
    
    /// A child of the person.
    public var children: [Person]?
    
    /// A colleague of the person.
    public var colleagues: [PersonOrURL]?
    
    /// A contact point for a person or organization.
    public var contactPoints: [ContactPoint]?
    
    /// Date of death.
    public var deathDate: DateOnly?
    
    /// The place where the person died.
    public var deathPlace: Place?
    
    /// The Dun & Bradstreet DUNS number for identifying an organization or
    /// business person.
    public var duns: String?
    
    /// Email address.
    public var email: String?
    
    /// Family name. In the U.S., the last name of an Person. This can be used
    /// along with givenName instead of the name property.
    public var familyName: String?
    
    /// The fax number.
    public var faxNumber: String?
    
    /// The most generic uni-directional social relation.
    public var follows: [Person]?
    
    /// A person or organization that supports (sponsors) something through some
    /// kind of financial contribution.
    public var funder: OrganizationOrPerson?
    
    /// Gender of the person. While http://schema.org/Male and
    /// http://schema.org/Female may be used, text strings are also acceptable
    /// for people who do not identify as a binary gender.
    public var gender: GenderOrText?
    
    /// Given name. In the U.S., the first name of a Person. This can be used
    /// along with familyName instead of the name property.
    public var givenName: String?
    
    /// The Global Location Number (GLN, sometimes also referred to as
    /// International Location Number or ILN) of the respective organization,
    /// person, or place. The GLN is a 13-digit number used to identify parties
    /// and physical locations.
    public var globalLocationNumber: String?
    
    /// Indicates an OfferCatalog listing for this Organization, Person, or
    /// Service.
    public var offerCatalog: OfferCatalog?
    
    /// Points-of-Sales operated by the organization or person.
    public var pointsOfSales: [Place]?
    
    /// The height of the item.
    public var height: DistanceOrQuantitativeValue?
    
    /// A contact location for a person's residence.
    public var homeLocation: ContactPointOrPlace?
    
    /// An honorific prefix preceding a Person's name such as Dr/Mrs/Mr.
    public var honorificPrefix: String?
    
    /// An honorific suffix preceding a Person's name such as M.D. /PhD/MSCSW.
    public var honorificSuffix: String?
    
    /// The International Standard of Industrial Classification of All Economic
    /// Activities (ISIC), Revision 4 code for a particular organization,
    /// business person, or place.
    public var isicV4: String?
    
    /// The job title of the person (for example, Financial Manager).
    public var jobTitle: String?
    
    /// The most generic bi-directional social/work relation.
    public var knows: [Person]?
    
    /// A pointer to products or services offered by the organization or person.
    /// - **Inverse property**: _offeredBy_
    public var makesOffer: [Offer]?
    
    /// An Organization (or ProgramMembership) to which this Person or
    /// Organization belongs.
    /// - **Inverse property**: _member_
    public var memberOf: [OrganizationOrProgramMembership]?
    
    /// The North American Industry Classification System (NAICS) code for a
    /// particular organization or business person.
    public var naics: String?
    
    /// Nationality of the person.
    public var nationality: Country?
    
    /// The total financial value of the person as calculated by subtracting
    /// assets from liabilities.
    public var netWorth: MonetaryAmountOrPriceSpecification?
    
    /// The Person's occupation. For past professions, use Role for expressing
    /// dates.
    public var occupation: Occupation?
    
    /// Products owned by the organization or person.
    public var owns: [ProductOrService]?
    
    /// A parent of this person.
    public var parents: [Person]?
    
    /// Event that this person is a performer or participant in.
    public var performerIn: Event?
    
    /// The publishingPrinciples property indicates (typically via URL) a
    /// document describing the editorial principles of an Organization (or
    /// individual e.g. a Person writing a blog) that relate to their activities
    /// as a publisher, e.g. ethics or diversity policies. When applied to a
    /// CreativeWork (e.g. NewsArticle) the principles are those of the party
    /// primarily responsible for the creation of the CreativeWork.
    /// While such policies are most typically expressed in natural language,
    /// sometimes related information (e.g. indicating a funder) can be
    /// expressed using schema.org terminology.
    public var publishingPrinciples: CreativeWorkOrURL?
    
    /// The most generic familial relation.
    public var relatedTo: [Person]?
    
    /// A pointer to products or services sought by the organization or person
    /// (demand).
    public var seeks: [Demand]?
    
    /// A sibling of the person.
    public var siblings: [Person]?
    
    /// A person or organization that supports a thing through a pledge,
    /// promise, or financial contribution. e.g. a sponsor of a Medical Study or
    /// a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    
    /// The person's spouse.
    public var spouse: Person?
    
    /// The Tax / Fiscal ID of the organization or person, e.g. the TIN in the
    /// US or the CIF/NIF in Spain.
    public var taxID: String?
    
    /// The telephone number.
    public var telephone: String?
    
    /// The Value-added Tax ID of the organization or person.
    public var vatID: String?
    
    /// The weight of the product or person.
    public var weight: QuantitativeValue?
    
    /// A contact location for a person's place of work.
    public var workLocation: ContactPointOrPlace?
    
    /// Organizations that the person works for.
    public var worksFor: [Organization]?
    
    private enum CodingKeys: String, CodingKey {
        case additionalName
        case address
        case affiliation
        case alumniOf
        case awards = "award"
        case birthDate
        case birthPlace
        case brands = "brand"
        case children
        case colleagues = "colleague"
        case contactPoints = "contactPoint"
        case deathDate
        case deathPlace
        case duns
        case email
        case familyName
        case faxNumber
        case follows
        case funder
        case gender
        case givenName
        case globalLocationNumber
        case offerCatalog = "hasOfferCatalog"
        case pointsOfSales = "hasPOS"
        case height
        case homeLocation
        case honorificPrefix
        case honorificSuffix
        case isicV4
        case jobTitle
        case knows
        case makesOffer
        case memberOf
        case naics
        case nationality
        case netWorth
        case occupation = "hasOccupation"
        case owns
        case parents = "parent"
        case performerIn
        case publishingPrinciples
        case relatedTo
        case seeks
        case siblings = "sibling"
        case sponsor
        case spouse
        case taxID
        case telephone
        case vatID
        case weight
        case workLocation
        case worksFor
    }
    
}
