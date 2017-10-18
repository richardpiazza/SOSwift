import Foundation
import SOSwiftVocabulary

/// An organization such as a school, NGO, corporation, club, etc.
public class SOOrganization: SOThing, Organization {

    public override class var type: String {
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
        
        if let value = try container.decodePostalAddressOrTextIfPresent(forKey: .address) {
            self.address = value
        }
        if let value = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating) {
            self.aggregateRating = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .alumni) {
            self.alumni = value
        }
        if let value = try container.decodeIfPresent([String].self, forKey: .award) {
            self.award = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .areaSurved) {
            self.areaServed = value
        }
        if let value = try container.decodeBrandsOrOrganizationsIfPresent(forKey: .brand) {
            self.brand = value
        }
        if let value = try container.decodeIfPresent([SOContactPoint].self, forKey: .contactPoint) {
            self.contactPoint = value
        }
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey: .department) {
            self.department = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .dissolutionDate) {
            self.dissolutionDate = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .duns) {
            self.duns = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .email) {
            self.email = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .employee) {
            self.employee = value
        }
        if let value = try container.decodeIfPresent([SOEvent].self, forKey: .event) {
            self.event = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .faxNumber) {
            self.faxNumber = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .founder) {
            self.founder = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .foundingDate) {
            self.foundingDate = value
        }
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .foundingLocation) {
            self.foundingLocation = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder) {
            self.funder = value
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
        if let value = try container.decodeIfPresent(String.self, forKey: .isicV4) {
            self.isicV4 = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .legalName) {
            self.legalName = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .leiCode) {
            self.leiCode = value
        }
        if let value = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .location) {
            self.location = value
        }
        if let value = try container.decodeImageObjectOrURLIfPresent(forKey: .logo) {
            self.logo = value
        }
        if let value = try container.decodeIfPresent([SOOffer].self, forKey: .makesOffers) {
            self.makesOffers = value
        }
        if let value = try container.decodeOrganizationsOrPersonsIfPresent(forKey: .member) {
            self.member = value
        }
        if let value = try container.decodeOrganizationOrProgramMembershipIfPresent(forKey: .memberOf) {
            self.memberOf = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .naics) {
            self.naics = value
        }
        if let value = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .numberOfEmployees) {
            self.numberOfEmployees = value
        }
        if let value = try container.decodeOwnershipInfosOrProductsIfPresent(forKey: .owns) {
            self.owns = value
        }
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey: .parentOrganization) {
            self.parentOrganization = value
        }
        if let value = try container.decodeIfPresent([SOReview].self, forKey: .review) {
            self.review = value
        }
        if let value = try container.decodeIfPresent([SODemand].self, forKey: .seeks) {
            self.seeks = value
        }
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor) {
            self.sponsor = value
        }
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey: .subOrganization) {
            self.subOrganization = value
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
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.address {
            try container.encodePostalAddressOrText(value, forKey: .address)
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            try container.encode(value, forKey: .aggregateRating)
        }
        if let value = self.alumni as? [SOPerson] {
            try container.encode(value, forKey: .alumni)
        }
        if let value = self.areaServed as? String {
            try container.encode(value, forKey: .areaSurved)
        }
        if let value = self.award {
            try container.encode(value, forKey: .award)
        }
        if let value = self.brand {
            try container.encodeBrandsOrOrganizations(value, forKey: .brand)
        }
        if let value = self.contactPoint as? [SOContactPoint] {
            try container.encode(value, forKey: .contactPoint)
        }
        if let value = self.department as? SOOrganization {
            try container.encode(value, forKey: .department)
        }
        if let value = self.dissolutionDate as? String {
            try container.encode(value, forKey: .dissolutionDate)
        }
        if let value = self.duns {
            try container.encode(value, forKey: .duns)
        }
        if let value = self.email {
            try container.encode(value, forKey: .email)
        }
        if let value = self.employee as? [SOPerson] {
            try container.encode(value, forKey: .employee)
        }
        if let value = self.event as? [SOEvent] {
            try container.encode(value, forKey: .event)
        }
        if let value = self.faxNumber {
            try container.encode(value, forKey: .faxNumber)
        }
        if let value = self.founder as? [SOPerson] {
            try container.encode(value, forKey: .founder)
        }
        if let value = self.foundingDate as? String {
            try container.encode(value, forKey: .foundingDate)
        }
        if let value = self.foundingLocation as? SOPlace {
            try container.encode(value, forKey: .foundingLocation)
        }
        if let value = self.funder {
            try container.encodeOrganizationOrPerson(value, forKey: .funder)
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
        if let value = self.isicV4 {
            try container.encode(value, forKey: .isicV4)
        }
        if let value = self.legalName {
            try container.encode(value, forKey: .legalName)
        }
        if let value = self.leiCode {
            try container.encode(value, forKey: .leiCode)
        }
        if let value = self.location {
            try container.encodePlaceOrPostalAddressOrText(value, forKey: .location)
        }
        if let value = self.logo {
            try container.encodeImageObjectOrURL(value, forKey: .logo)
        }
        if let value = self.makesOffers as? [SOOffer] {
            try container.encode(value, forKey: .makesOffers)
        }
        if let value = self.member {
            try container.encodeOrganizationsOrPersons(value, forKey: .member)
        }
        if let value = self.memberOf {
            try container.encodeOrganizationOrProgramMembership(value, forKey: .memberOf)
        }
        if let value = self.naics {
            try container.encode(value, forKey: .naics)
        }
        if let value = self.numberOfEmployees as? SOQuantitativeValue {
            try container.encode(value, forKey: .numberOfEmployees)
        }
        if let value = self.owns {
            try container.encodeOwnershipInfosOrProducts(value, forKey: .owns)
        }
        if let value = self.parentOrganization as? SOOrganization {
            try container.encode(value, forKey: .parentOrganization)
        }
        if let value = self.review as? [SOReview] {
            try container.encode(value, forKey: .review)
        }
        if let value = self.seeks as? [SODemand] {
            try container.encode(value, forKey: .seeks)
        }
        if let value = self.sponsor {
            try container.encodeOrganizationOrPerson(value, forKey: .sponsor)
        }
        if let value = self.subOrganization as? SOOrganization {
            try container.encode(value, forKey: .subOrganization)
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
        
        try super.encode(to: encoder)
    }
}
