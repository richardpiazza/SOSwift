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
        
        if let value = try container.decodeIfPresent(String.self, forKey: .additionalName) {
            self.additionalName = value
        }
        if let value = try container.decodePostalAddressOrTextIfPresent(forKey: .address) {
            self.address = value
        }
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey: .affiliation) {
            self.affiliation = value
        }
        if let value = try container.decodeEducationalOrganizationOrOrganizationIfPresent(forKey: .alumniOf) {
            self.alumniOf = value
        }
        if let value = try container.decodeIfPresent([String].self, forKey: .award) {
            self.award = value
        }
        self.birthDate = try container.decodeDateOnlyIfPresent(forKey: .birthDate)
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .birthPlace) {
            self.birthPlace = value
        }
        if let value = try container.decodeBrandsOrOrganizationsIfPresent(forKey: .brand) {
            self.brand = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .children) {
            self.children = value
        }
        if let value = try container.decodePersonsOrURLsIfPresent(forKey: .colleague) {
            self.colleague = value
        }
        if let value = try container.decodeIfPresent([SOContactPoint].self, forKey: .contactPoint) {
            self.contactPoint = value
        }
        self.deathDate = try container.decodeDateOnlyIfPresent(forKey: .deathDate)
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .deathPlace) {
            self.deathPlace = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .duns) {
            self.duns = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .email) {
            self.email = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .familyName) {
            self.familyName = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .faxNumber) {
            self.faxNumber = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .follows) {
            self.follows = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder) {
            self.funder = value
        }
        if let value = try container.decodeGenderOrTextIfPresent(forKey: .gender) {
            self.gender = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .givenName) {
            self.givenName = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .globalLocationNumber) {
            self.globalLocationNumber = value
        }
        if let value = try container.decodeIfPresent(SOOfferCatalog.self, forKey: .hasOfferCatalog) {
            self.hasOfferCatalog = value
        }
        if let value = try container.decodeIfPresent([SOPlace].self, forKey: .hasPOS) {
            self.hasPOS = value
        }
        if let value = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .height) {
            self.height = value
        }
        if let value = try container.decodeContactPointOrPlaceIfPresent(forKey: .homeLocation) {
            self.homeLocation = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .honorificPrefix) {
            self.honorificPrefix = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .honorificSuffix) {
            self.honorificSuffix = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .isicV4) {
            self.isicV4 = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .jobTitle) {
            self.jobTitle = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .knows) {
            self.knows = value
        }
        if let value = try container.decodeIfPresent([SOOffer].self, forKey: .makesOffer) {
            self.makesOffer = value
        }
        if let value = try container.decodeOrganizationsOrProgramMembershipsIfPresent(forKey: .memberOf) {
            self.memberOf = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .naics) {
            self.naics = value
        }
        if let value = try container.decodeIfPresent(SOCountry.self, forKey: .nationality) {
            self.nationality = value
        }
        if let value = try container.decodeMonetaryAmountOrPriceSpecificationIfPresent(forKey: .netWorth) {
            self.netWorth = value
        }
        if let value = try container.decodeProductsOrServicesIfPresent(forKey: .owns) {
            self.owns = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .parent) {
            self.parent = value
        }
        if let value = try container.decodeIfPresent(SOEvent.self, forKey: .performerIn) {
            self.performerIn = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .relatedTo) {
            self.relatedTo = value
        }
        if let value = try container.decodeIfPresent([SODemand].self, forKey: .seeks) {
            self.seeks = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .sibling) {
            self.sibling = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor) {
            self.sponsor = value
        }
        if let value = try container.decodeIfPresent(SOPerson.self, forKey: .spouse) {
            self.spouse = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .taxID) {
            self.taxID = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .telephone) {
            self.telephone = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .vatID) {
            self.vatID = value
        }
        if let value = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .weight) {
            self.weight = value
        }
        if let value = try container.decodeContactPointOrPlaceIfPresent(forKey: .workLocation) {
            self.workLocation = value
        }
        if let value = try container.decodeIfPresent([SOOrganization].self, forKey: .worksFor) {
            self.worksFor = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.additionalName {
            try container.encode(value, forKey: .additionalName)
        }
        try container.encodeIfPresent(self.address, forKey: .address)
        if let value = self.affiliation as? SOOrganization {
            try container.encode(value, forKey: .affiliation)
        }
        try container.encodeIfPresent(self.alumniOf, forKey: .alumniOf)
        if let value = self.award {
            try container.encode(value, forKey: .award)
        }
        try container.encodeIfPresent(self.birthDate, forKey: .birthDate)
        if let value = self.birthPlace as? SOPlace {
            try container.encode(value, forKey: .birthPlace)
        }
        try container.encodeIfPresent(self.brand, forKey: .brand)
        if let value = self.children as? [SOPerson] {
            try container.encode(value, forKey: .children)
        }
        try container.encodeIfPresent(self.colleague, forKey: .colleague)
        if let value = self.contactPoint as? [SOContactPoint] {
            try container.encode(value, forKey: .contactPoint)
        }
        try container.encodeIfPresent(self.deathDate, forKey: .deathDate)
        if let value = self.deathPlace as? SOPlace {
            try container.encode(value, forKey: .deathPlace)
        }
        if let value = self.duns {
            try container.encode(value, forKey: .duns)
        }
        if let value = self.email {
            try container.encode(value, forKey: .email)
        }
        if let value = self.familyName {
            try container.encode(value, forKey: .familyName)
        }
        if let value = self.faxNumber {
            try container.encode(value, forKey: .faxNumber)
        }
        if let value = self.follows as? [SOPerson] {
            try container.encode(value, forKey: .follows)
        }
        try container.encodeIfPresent(self.funder, forKey: .funder)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        if let value = self.givenName {
            try container.encode(value, forKey: .givenName)
        }
        if let value = self.globalLocationNumber {
            try container.encode(value, forKey: .globalLocationNumber)
        }
        if let value = self.hasOfferCatalog as? SOOfferCatalog {
            try container.encode(value, forKey: .hasOfferCatalog)
        }
        if let value = self.hasPOS as? [SOPlace] {
            try container.encode(value, forKey: .hasPOS)
        }
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.homeLocation, forKey: .homeLocation)
        if let value = self.honorificPrefix {
            try container.encode(value, forKey: .honorificPrefix)
        }
        if let value = self.honorificSuffix {
            try container.encode(value, forKey: .honorificSuffix)
        }
        if let value = self.isicV4 {
            try container.encode(value, forKey: .isicV4)
        }
        if let value = self.jobTitle {
            try container.encode(value, forKey: .jobTitle)
        }
        if let value = self.knows as? [SOPerson] {
            try container.encode(value, forKey: .knows)
        }
        if let value = self.makesOffer as? [SOOffer] {
            try container.encode(value, forKey: .makesOffer)
        }
        try container.encodeIfPresent(self.memberOf, forKey: .memberOf)
        if let value = self.naics {
            try container.encode(value, forKey: .naics)
        }
        if let value = self.nationality as? SOCountry {
            try container.encode(value, forKey: .nationality)
        }
        try container.encodeIfPresent(self.netWorth, forKey: .netWorth)
        try container.encodeIfPresent(self.owns, forKey: .owns)
        if let value = self.parent as? [SOPerson] {
            try container.encode(value, forKey: .parent)
        }
        if let value = self.performerIn as? SOEvent {
            try container.encode(value, forKey: .performerIn)
        }
        if let value = self.relatedTo as? [SOPerson] {
            try container.encode(value, forKey: .relatedTo)
        }
        if let value = self.seeks as? [SODemand] {
            try container.encode(value, forKey: .seeks)
        }
        if let value = self.sibling as? [SOPerson] {
            try container.encode(value, forKey: .sibling)
        }
        try container.encodeIfPresent(self.sponsor, forKey: .sponsor)
        if let value = self.spouse as? SOPerson {
            try container.encode(value, forKey: .spouse)
        }
        if let value = self.taxID {
            try container.encode(value, forKey: .taxID)
        }
        if let value = self.telephone {
            try container.encode(value, forKey: .telephone)
        }
        if let value = self.vatID {
            try container.encode(value, forKey: .vatID)
        }
        if let value = self.weight as? SOQuantitativeValue {
            try container.encode(value, forKey: .weight)
        }
        try container.encodeIfPresent(self.workLocation, forKey: .workLocation)
        if let value = self.worksFor as? [SOOrganization] {
            try container.encode(value, forKey: .worksFor)
        }
        
        try super.encode(to: encoder)
    }
}
