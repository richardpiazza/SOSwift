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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.address = try container.decodePostalAddressOrTextIfPresent(forKey: .address)
        self.aggregateRating = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating)
        self.alumni = try container.decodeIfPresent([SOPerson].self, forKey: .alumni)
        self.award = try container.decodeIfPresent([String].self, forKey: .award)
        self.areaServed = try container.decodeIfPresent(String.self, forKey: .areaSurved)
        self.brand = try container.decodeBrandsOrOrganizationsIfPresent(forKey: .brand)
        self.contactPoint = try container.decodeIfPresent([SOContactPoint].self, forKey: .contactPoint)
        self.department = try container.decodeIfPresent(SOOrganization.self, forKey: .department)
        self.dissolutionDate = try container.decodeDateOnlyIfPresent(forKey: .dissolutionDate)
        self.duns = try container.decodeIfPresent(String.self, forKey: .duns)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.employee = try container.decodeIfPresent([SOPerson].self, forKey: .employee)
        self.event = try container.decodeIfPresent([SOEvent].self, forKey: .event)
        self.faxNumber = try container.decodeIfPresent(String.self, forKey: .faxNumber)
        self.founder = try container.decodeIfPresent([SOPerson].self, forKey: .founder)
        self.foundingDate = try container.decodeDateOnlyIfPresent(forKey: .foundingDate)
        self.foundingLocation = try container.decodeIfPresent(SOPlace.self, forKey: .foundingLocation)
        self.funder = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder)
        self.globalLocationNumber = try container.decodeIfPresent(String.self, forKey: .globalLocationNumber)
        self.hasOfferCatalog = try container.decodeIfPresent(SOOfferCatalog.self, forKey: .hasOfferCatalog)
        self.hasPOS = try container.decodeIfPresent([SOPlace].self, forKey: .hasPOS)
        self.isicV4 = try container.decodeIfPresent(String.self, forKey: .isicV4)
        self.legalName = try container.decodeIfPresent(String.self, forKey: .legalName)
        self.leiCode = try container.decodeIfPresent(String.self, forKey: .leiCode)
        self.location = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .location)
        self.logo = try container.decodeImageObjectOrURLIfPresent(forKey: .logo)
        self.makesOffers = try container.decodeIfPresent([SOOffer].self, forKey: .makesOffers)
        self.member = try container.decodeOrganizationsOrPersonsIfPresent(forKey: .member)
        self.memberOf = try container.decodeOrganizationOrProgramMembershipIfPresent(forKey: .memberOf)
        self.naics = try container.decodeIfPresent(String.self, forKey: .naics)
        self.numberOfEmployees = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .numberOfEmployees)
        self.owns = try container.decodeOwnershipInfosOrProductsIfPresent(forKey: .owns)
        self.parentOrganization = try container.decodeIfPresent(SOOrganization.self, forKey: .parentOrganization)
        self.review = try container.decodeIfPresent([SOReview].self, forKey: .review)
        self.seeks = try container.decodeIfPresent([SODemand].self, forKey: .seeks)
        self.sponsor = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor)
        self.subOrganization = try container.decodeIfPresent(SOOrganization.self, forKey: .subOrganization)
        self.taxID = try container.decodeIfPresent(String.self, forKey: .taxID)
        self.telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
        self.vatID = try container.decodeIfPresent(String.self, forKey: .vatID)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(self.alumni, forKey: .alumni)
        try container.encodeIfPresent(self.areaServed, forKey: .areaSurved)
        try container.encodeIfPresent(self.award, forKey: .award)
        try container.encodeIfPresent(self.brand, forKey: .brand)
        try container.encodeIfPresent(self.contactPoint, forKey: .contactPoint)
        try container.encodeIfPresent(self.department, forKey: .department)
        try container.encodeIfPresent(self.dissolutionDate, forKey: .dissolutionDate)
        try container.encodeIfPresent(self.duns, forKey: .duns)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.employee, forKey: .employee)
        try container.encodeIfPresent(self.event, forKey: .event)
        try container.encodeIfPresent(self.faxNumber, forKey: .faxNumber)
        try container.encodeIfPresent(self.founder, forKey: .founder)
        try container.encodeIfPresent(self.foundingDate, forKey: .foundingDate)
        try container.encodeIfPresent(self.foundingLocation, forKey: .foundingLocation)
        try container.encodeIfPresent(self.funder, forKey: .funder)
        try container.encodeIfPresent(self.globalLocationNumber, forKey: .globalLocationNumber)
        try container.encodeIfPresent(self.hasOfferCatalog, forKey: .hasOfferCatalog)
        try container.encodeIfPresent(self.hasPOS, forKey: .hasPOS)
        try container.encodeIfPresent(self.isicV4, forKey: .isicV4)
        try container.encodeIfPresent(self.legalName, forKey: .legalName)
        try container.encodeIfPresent(self.leiCode, forKey: .leiCode)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.logo, forKey: .logo)
        try container.encodeIfPresent(self.makesOffers, forKey: .makesOffers)
        try container.encodeIfPresent(self.member, forKey: .member)
        try container.encodeIfPresent(self.memberOf, forKey: .memberOf)
        try container.encodeIfPresent(self.naics, forKey: .naics)
        try container.encodeIfPresent(self.numberOfEmployees, forKey: .numberOfEmployees)
        try container.encodeIfPresent(self.owns, forKey: .owns)
        try container.encodeIfPresent(self.parentOrganization, forKey: .parentOrganization)
        try container.encodeIfPresent(self.review, forKey: .review)
        try container.encodeIfPresent(self.seeks, forKey: .seeks)
        try container.encodeIfPresent(self.sponsor, forKey: .sponsor)
        try container.encodeIfPresent(self.subOrganization, forKey: .subOrganization)
        try container.encodeIfPresent(self.taxID, forKey: .taxID)
        try container.encodeIfPresent(self.telephone, forKey: .telephone)
        try container.encodeIfPresent(self.vatID, forKey: .vatID)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Organization?, forKey key: K) throws {
        if let typedValue = value as? SOOrganization {
            try self.encode(typedValue, forKey: key)
        }
    }
}
