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
    
    internal enum PersonCodingKeys: String, CodingKey {
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: PersonCodingKeys.self)
        
        additionalName = try container.decodeIfPresent(String.self, forKey: .additionalName)
        address = try container.decodeIfPresent(PostalAddressOrText.self, forKey: .address)
        affiliation = try container.decodeIfPresent(Organization.self, forKey: .affiliation)
        alumniOf = try container.decodeIfPresent(EducationalOrganizationOrOrganization.self, forKey: .alumniOf)
        awards = try container.decodeIfPresent([String].self, forKey: .awards)
        birthDate = try container.decodeIfPresent(DateOnly.self, forKey: .birthDate)
        birthPlace = try container.decodeIfPresent(Place.self, forKey: .birthPlace)
        brands = try container.decodeIfPresent([BrandOrOrganization].self, forKey: .brands)
        children = try container.decodeIfPresent([Person].self, forKey: .children)
        colleagues = try container.decodeIfPresent([PersonOrURL].self, forKey: .colleagues)
        contactPoints = try container.decodeIfPresent([ContactPoint].self, forKey: .contactPoints)
        deathDate = try container.decodeIfPresent(DateOnly.self, forKey: .deathDate)
        deathPlace = try container.decodeIfPresent(Place.self, forKey: .deathPlace)
        duns = try container.decodeIfPresent(String.self, forKey: .duns)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        familyName = try container.decodeIfPresent(String.self, forKey: .familyName)
        faxNumber = try container.decodeIfPresent(String.self, forKey: .faxNumber)
        follows = try container.decodeIfPresent([Person].self, forKey: .follows)
        funder = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .funder)
        gender = try container.decodeIfPresent(GenderOrText.self, forKey: .gender)
        givenName = try container.decodeIfPresent(String.self, forKey: .givenName)
        globalLocationNumber = try container.decodeIfPresent(String.self, forKey: .globalLocationNumber)
        offerCatalog = try container.decodeIfPresent(OfferCatalog.self, forKey: .offerCatalog)
        pointsOfSales = try container.decodeIfPresent([Place].self, forKey: .pointsOfSales)
        height = try container.decodeIfPresent(DistanceOrQuantitativeValue.self, forKey: .height)
        homeLocation = try container.decodeIfPresent(ContactPointOrPlace.self, forKey: .homeLocation)
        honorificPrefix = try container.decodeIfPresent(String.self, forKey: .honorificPrefix)
        honorificSuffix = try container.decodeIfPresent(String.self, forKey: .honorificSuffix)
        isicV4 = try container.decodeIfPresent(String.self, forKey: .isicV4)
        jobTitle = try container.decodeIfPresent(String.self, forKey: .jobTitle)
        knows = try container.decodeIfPresent([Person].self, forKey: .knows)
        makesOffer = try container.decodeIfPresent([Offer].self, forKey: .makesOffer)
        memberOf = try container.decodeIfPresent([OrganizationOrProgramMembership].self, forKey: .memberOf)
        naics = try container.decodeIfPresent(String.self, forKey: .naics)
        nationality = try container.decodeIfPresent(Country.self, forKey: .nationality)
        netWorth = try container.decodeIfPresent(MonetaryAmountOrPriceSpecification.self, forKey: .netWorth)
        occupation = try container.decodeIfPresent(Occupation.self, forKey: .occupation)
        owns = try container.decodeIfPresent([ProductOrService].self, forKey: .owns)
        parents = try container.decodeIfPresent([Person].self, forKey: .parents)
        performerIn = try container.decodeIfPresent(Event.self, forKey: .performerIn)
        publishingPrinciples = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .publishingPrinciples)
        relatedTo = try container.decodeIfPresent([Person].self, forKey: .relatedTo)
        seeks = try container.decodeIfPresent([Demand].self, forKey: .seeks)
        siblings = try container.decodeIfPresent([Person].self, forKey: .siblings)
        sponsor = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .sponsor)
        spouse = try container.decodeIfPresent(Person.self, forKey: .spouse)
        taxID = try container.decodeIfPresent(String.self, forKey: .taxID)
        telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
        vatID = try container.decodeIfPresent(String.self, forKey: .vatID)
        weight = try container.decodeIfPresent(QuantitativeValue.self, forKey: .weight)
        workLocation = try container.decodeIfPresent(ContactPointOrPlace.self, forKey: .workLocation)
        worksFor = try container.decodeIfPresent([Organization].self, forKey: .worksFor)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PersonCodingKeys.self)
        
        try container.encodeIfPresent(additionalName, forKey: .additionalName)
        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(affiliation, forKey: .affiliation)
        try container.encodeIfPresent(alumniOf, forKey: .alumniOf)
        try container.encodeIfPresent(awards, forKey: .awards)
        try container.encodeIfPresent(birthDate, forKey: .birthDate)
        try container.encodeIfPresent(birthPlace, forKey: .birthPlace)
        try container.encodeIfPresent(brands, forKey: .brands)
        try container.encodeIfPresent(children, forKey: .children)
        try container.encodeIfPresent(colleagues, forKey: .colleagues)
        try container.encodeIfPresent(contactPoints, forKey: .contactPoints)
        try container.encodeIfPresent(deathDate, forKey: .deathDate)
        try container.encodeIfPresent(deathPlace, forKey: .deathPlace)
        try container.encodeIfPresent(duns, forKey: .duns)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(familyName, forKey: .familyName)
        try container.encodeIfPresent(faxNumber, forKey: .faxNumber)
        try container.encodeIfPresent(follows, forKey: .follows)
        try container.encodeIfPresent(funder, forKey: .funder)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(givenName, forKey: .givenName)
        try container.encodeIfPresent(globalLocationNumber, forKey: .globalLocationNumber)
        try container.encodeIfPresent(offerCatalog, forKey: .offerCatalog)
        try container.encodeIfPresent(pointsOfSales, forKey: .pointsOfSales)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(homeLocation, forKey: .homeLocation)
        try container.encodeIfPresent(honorificPrefix, forKey: .honorificPrefix)
        try container.encodeIfPresent(honorificSuffix, forKey: .honorificSuffix)
        try container.encodeIfPresent(isicV4, forKey: .isicV4)
        try container.encodeIfPresent(jobTitle, forKey: .jobTitle)
        try container.encodeIfPresent(knows, forKey: .knows)
        try container.encodeIfPresent(makesOffer, forKey: .makesOffer)
        try container.encodeIfPresent(memberOf, forKey: .memberOf)
        try container.encodeIfPresent(naics, forKey: .naics)
        try container.encodeIfPresent(nationality, forKey: .nationality)
        try container.encodeIfPresent(netWorth, forKey: .netWorth)
        try container.encodeIfPresent(occupation, forKey: .occupation)
        try container.encodeIfPresent(owns, forKey: .owns)
        try container.encodeIfPresent(parents, forKey: .parents)
        try container.encodeIfPresent(performerIn, forKey: .performerIn)
        try container.encodeIfPresent(publishingPrinciples, forKey: .publishingPrinciples)
        try container.encodeIfPresent(relatedTo, forKey: .relatedTo)
        try container.encodeIfPresent(seeks, forKey: .seeks)
        try container.encodeIfPresent(siblings, forKey: .siblings)
        try container.encodeIfPresent(sponsor, forKey: .sponsor)
        try container.encodeIfPresent(spouse, forKey: .spouse)
        try container.encodeIfPresent(taxID, forKey: .taxID)
        try container.encodeIfPresent(telephone, forKey: .telephone)
        try container.encodeIfPresent(vatID, forKey: .vatID)
        try container.encodeIfPresent(weight, forKey: .weight)
        try container.encodeIfPresent(workLocation, forKey: .workLocation)
        try container.encodeIfPresent(worksFor, forKey: .worksFor)
        
        try super.encode(to: encoder)
    }
}
