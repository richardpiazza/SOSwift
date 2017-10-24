import Foundation
import SOSwiftVocabulary

/// A person (alive, dead, undead, or fictional).
public class SOPerson: SOThing, Person {

    public override class var type: String {
        return "Person"
    }
    
    /// An additional name for a Person, can be used for a middle name.
    public var additionalName: String?
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    /// An organization that this person is affiliated with. For example, a school/university, a club, or a team.
    public var affiliation: Organization?
    /// An organization that the person is an alumni of. Inverse property: alumni.
    public var alumniOf: EducationalOrganizationOrOrganization?
    /// An award won by or for this item.
    public var award: [String]?
    /// Date of birth.
    public var birthDate: DateOnly?
    /// The place where the person was born.
    public var birthPlace: Place?
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    public var brand: [BrandOrOrganization]?
    /// A child of the person.
    public var children: [Person]?
    /// A colleague of the person.
    public var colleague: [PersonOrURL]?
    /// A contact point for a person or organization.
    public var contactPoint: [ContactPoint]?
    /// Date of death.
    public var deathDate: DateOnly?
    /// The place where the person died.
    public var deathPlace: Place?
    /// The Dun & Bradstreet DUNS number for identifying an organization or business person.
    public var duns: String?
    /// Email address.
    public var email: String?
    /// Family name. In the U.S., the last name of an Person. This can be used along with givenName instead of the name property.
    public var familyName: String?
    /// The fax number.
    public var faxNumber: String?
    /// The most generic uni-directional social relation.
    public var follows: [Person]?
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    public var funder: OrganizationOrPerson?
    /// Gender of the person. While http://schema.org/Male and http://schema.org/Female may be used, text strings are also acceptable for people who do not identify as a binary gender.
    public var gender: GenderOrText?
    /// Given name. In the U.S., the first name of a Person. This can be used along with familyName instead of the name property.
    public var givenName: String?
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    public var globalLocationNumber: String?
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    public var hasOfferCatalog: OfferCatalog?
    /// Points-of-Sales operated by the organization or person.
    public var hasPOS: [Place]?
    /// The height of the item.
    public var height: DistanceOrQuantitativeValue?
    /// A contact location for a person's residence.
    public var homeLocation: ContactPointOrPlace?
    /// An honorific prefix preceding a Person's name such as Dr/Mrs/Mr.
    public var honorificPrefix: String?
    /// An honorific suffix preceding a Person's name such as M.D. /PhD/MSCSW.
    public var honorificSuffix: String?
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
    public var isicV4: String?
    /// The job title of the person (for example, Financial Manager).
    public var jobTitle: String?
    /// The most generic bi-directional social/work relation.
    public var knows: [Person]?
    /// A pointer to products or services offered by the organization or person. Inverse property: offeredBy.
    public var makesOffer: [Offer]?
    /// An Organization (or ProgramMembership) to which this Person or Organization belongs. Inverse property: member.
    public var memberOf: [OrganizationOrProgramMembership]?
    /// The North American Industry Classification System (NAICS) code for a particular organization or business person.
    public var naics: String?
    /// Nationality of the person.
    public var nationality: Country?
    /// The total financial value of the person as calculated by subtracting assets from liabilities.
    public var netWorth: MonetaryAmountOrPriceSpecification?
    /// Products owned by the organization or person.
    public var owns: [ProductOrService]?
    /// A parent of this person.
    public var parent: [Person]?
    /// Event that this person is a performer or participant in.
    public var performerIn: Event?
    /// The most generic familial relation.
    public var relatedTo: [Person]?
    /// A pointer to products or services sought by the organization or person (demand).
    public var seeks: [Demand]?
    /// A sibling of the person.
    public var sibling: [Person]?
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?
    /// The person's spouse.
    public var spouse: Person?
    /// The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
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
        case award
        case birthDate
        case birthPlace
        case brand
        case children
        case colleague
        case contactPoint
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
        case hasOfferCatalog
        case hasPOS
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
        case owns
        case parent
        case performerIn
        case relatedTo
        case seeks
        case sibling
        case sponsor
        case spouse
        case taxID
        case telephone
        case vatID
        case weight
        case workLocation
        case worksFor
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.additionalName = try container.decodeIfPresent(String.self, forKey: .additionalName)
        self.address = try container.decodePostalAddressOrTextIfPresent(forKey: .address)
        self.affiliation = try container.decodeIfPresent(SOOrganization.self, forKey: .affiliation)
        self.alumniOf = try container.decodeEducationalOrganizationOrOrganizationIfPresent(forKey: .alumniOf)
        self.award = try container.decodeIfPresent([String].self, forKey: .award)
        self.birthDate = try container.decodeDateOnlyIfPresent(forKey: .birthDate)
        self.birthPlace = try container.decodeIfPresent(SOPlace.self, forKey: .birthPlace)
        self.brand = try container.decodeBrandsOrOrganizationsIfPresent(forKey: .brand)
        self.children = try container.decodeIfPresent([SOPerson].self, forKey: .children)
        self.colleague = try container.decodePersonsOrURLsIfPresent(forKey: .colleague)
        self.contactPoint = try container.decodeIfPresent([SOContactPoint].self, forKey: .contactPoint)
        self.deathDate = try container.decodeDateOnlyIfPresent(forKey: .deathDate)
        self.deathPlace = try container.decodeIfPresent(SOPlace.self, forKey: .deathPlace)
        self.duns = try container.decodeIfPresent(String.self, forKey: .duns)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.familyName = try container.decodeIfPresent(String.self, forKey: .familyName)
        self.faxNumber = try container.decodeIfPresent(String.self, forKey: .faxNumber)
        self.follows = try container.decodeIfPresent([SOPerson].self, forKey: .follows)
        self.funder = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder)
        self.gender = try container.decodeGenderOrTextIfPresent(forKey: .gender)
        self.givenName = try container.decodeIfPresent(String.self, forKey: .givenName)
        self.globalLocationNumber = try container.decodeIfPresent(String.self, forKey: .globalLocationNumber)
        self.hasOfferCatalog = try container.decodeIfPresent(SOOfferCatalog.self, forKey: .hasOfferCatalog)
        self.hasPOS = try container.decodeIfPresent([SOPlace].self, forKey: .hasPOS)
        self.height = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .height)
        self.homeLocation = try container.decodeContactPointOrPlaceIfPresent(forKey: .homeLocation)
        self.honorificPrefix = try container.decodeIfPresent(String.self, forKey: .honorificPrefix)
        self.honorificSuffix = try container.decodeIfPresent(String.self, forKey: .honorificSuffix)
        self.isicV4 = try container.decodeIfPresent(String.self, forKey: .isicV4)
        self.jobTitle = try container.decodeIfPresent(String.self, forKey: .jobTitle)
        self.knows = try container.decodeIfPresent([SOPerson].self, forKey: .knows)
        self.makesOffer = try container.decodeIfPresent([SOOffer].self, forKey: .makesOffer)
        self.memberOf = try container.decodeOrganizationsOrProgramMembershipsIfPresent(forKey: .memberOf)
        self.naics = try container.decodeIfPresent(String.self, forKey: .naics)
        self.nationality = try container.decodeIfPresent(SOCountry.self, forKey: .nationality)
        self.netWorth = try container.decodeMonetaryAmountOrPriceSpecificationIfPresent(forKey: .netWorth)
        self.owns = try container.decodeProductsOrServicesIfPresent(forKey: .owns)
        self.parent = try container.decodeIfPresent([SOPerson].self, forKey: .parent)
        self.performerIn = try container.decodeIfPresent(SOEvent.self, forKey: .performerIn)
        self.relatedTo = try container.decodeIfPresent([SOPerson].self, forKey: .relatedTo)
        self.seeks = try container.decodeIfPresent([SODemand].self, forKey: .seeks)
        self.sibling = try container.decodeIfPresent([SOPerson].self, forKey: .sibling)
        self.sponsor = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor)
        self.spouse = try container.decodeIfPresent(SOPerson.self, forKey: .spouse)
        self.taxID = try container.decodeIfPresent(String.self, forKey: .taxID)
        self.telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
        self.vatID = try container.decodeIfPresent(String.self, forKey: .vatID)
        self.weight = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .weight)
        self.workLocation = try container.decodeContactPointOrPlaceIfPresent(forKey: .workLocation)
        self.worksFor = try container.decodeIfPresent([SOOrganization].self, forKey: .worksFor)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.additionalName, forKey: .additionalName)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.affiliation, forKey: .affiliation)
        try container.encodeIfPresent(self.alumniOf, forKey: .alumniOf)
        try container.encodeIfPresent(self.award, forKey: .award)
        try container.encodeIfPresent(self.birthDate, forKey: .birthDate)
        try container.encodeIfPresent(self.birthPlace, forKey: .birthPlace)
        try container.encodeIfPresent(self.brand, forKey: .brand)
        try container.encodeIfPresent(self.children, forKey: .children)
        try container.encodeIfPresent(self.colleague, forKey: .colleague)
        try container.encodeIfPresent(self.contactPoint, forKey: .contactPoint)
        try container.encodeIfPresent(self.deathDate, forKey: .deathDate)
        try container.encodeIfPresent(self.deathPlace, forKey: .deathPlace)
        try container.encodeIfPresent(self.duns, forKey: .duns)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.familyName, forKey: .familyName)
        try container.encodeIfPresent(self.faxNumber, forKey: .faxNumber)
        try container.encodeIfPresent(self.follows, forKey: .follows)
        try container.encodeIfPresent(self.funder, forKey: .funder)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encodeIfPresent(self.givenName, forKey: .givenName)
        try container.encodeIfPresent(self.globalLocationNumber, forKey: .globalLocationNumber)
        try container.encodeIfPresent(self.hasOfferCatalog, forKey: .hasOfferCatalog)
        try container.encodeIfPresent(self.hasPOS, forKey: .hasPOS)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.homeLocation, forKey: .homeLocation)
        try container.encodeIfPresent(self.honorificPrefix, forKey: .honorificPrefix)
        try container.encodeIfPresent(self.honorificSuffix, forKey: .honorificSuffix)
        try container.encodeIfPresent(self.isicV4, forKey: .isicV4)
        try container.encodeIfPresent(self.jobTitle, forKey: .jobTitle)
        try container.encodeIfPresent(self.knows, forKey: .knows)
        try container.encodeIfPresent(self.makesOffer, forKey: .makesOffer)
        try container.encodeIfPresent(self.memberOf, forKey: .memberOf)
        try container.encodeIfPresent(self.naics, forKey: .naics)
        try container.encodeIfPresent(self.nationality, forKey: .nationality)
        try container.encodeIfPresent(self.netWorth, forKey: .netWorth)
        try container.encodeIfPresent(self.owns, forKey: .owns)
        try container.encodeIfPresent(self.parent, forKey: .parent)
        try container.encodeIfPresent(self.performerIn, forKey: .performerIn)
        try container.encodeIfPresent(self.relatedTo, forKey: .relatedTo)
        try container.encodeIfPresent(self.seeks, forKey: .seeks)
        try container.encodeIfPresent(self.sibling, forKey: .sibling)
        try container.encodeIfPresent(self.sponsor, forKey: .sponsor)
        try container.encodeIfPresent(self.spouse, forKey: .spouse)
        try container.encodeIfPresent(self.taxID, forKey: .taxID)
        try container.encodeIfPresent(self.telephone, forKey: .telephone)
        try container.encodeIfPresent(self.vatID, forKey: .vatID)
        try container.encodeIfPresent(self.weight, forKey: .weight)
        try container.encodeIfPresent(self.workLocation, forKey: .workLocation)
        try container.encodeIfPresent(self.worksFor, forKey: .worksFor)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Person?, forKey key: K) throws {
        if let typedValue = value as? SOPerson {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [Person]?, forKey key: K) throws {
        if let typedValue = value as? [SOPerson] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
