import Foundation
import SOSwiftVocabulary

/// An organization such as a school, NGO, corporation, club, etc.
public class SOOrganization: SOThing, Organization {
    
    public override class var type: String {
        return "Organization"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return [
            SOEducationalOrganization.self,
            SOPerformingGroup.self
        ]
    }
    
    /// For a NewsMediaOrganization or other news-related Organization, a statement about public engagement activities (for news media, the newsroom’s), including involving the public - digitally or otherwise -- in coverage decisions, reporting and activities after publication.
    public var actionableFeedbackPolicy: CreativeWorkOrURL?
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
    public var awards: [String]?
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    public var brands: [BrandOrOrganization]?
    /// A contact point for a person or organization.
    public var contactPoints: [ContactPoint]?
    /// For an Organization (e.g. NewsMediaOrganization), a statement describing (in news media, the newsroom’s) disclosure and correction policy for errors.
    public var correctionsPolicy: CreativeWorkOrURL?
    /// A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.
    public var department: Organization?
    /// Statement on diversity policy by an Organization e.g. a NewsMediaOrganization. For a NewsMediaOrganization, a statement describing the newsroom’s diversity policy on both staffing and sources, typically providing staffing data.
    public var diversityPolicy: CreativeWorkOrURL?
    /// The date that this organization was dissolved.
    public var dissolutionDate: DateOnly?
    /// The Dun & Bradstreet DUNS number for identifying an organization or business person.
    public var duns: String?
    /// Email address.
    public var email: String?
    /// Someone working for this organization.
    public var employees: [Person]?
    /// Statement about ethics policy, e.g. of a NewsMediaOrganization regarding journalistic and publishing practices, or of a Restaurant, a page describing food source policies. In the case of a NewsMediaOrganization, an ethicsPolicy is typically a statement describing the personal, organizational, and corporate standards of behavior expected by the organization.
    public var ethicsPolicy: CreativeWorkOrURL?
    /// Upcoming or past event associated with this place, organization, or action.
    public var events: [Event]?
    /// The fax number.
    public var faxNumber: String?
    /// A person who founded this organization.
    public var founders: [Person]?
    /// The date that this organization was founded.
    public var foundingDate: DateOnly?
    /// The place where the Organization was founded.
    public var foundingLocation: Place?
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    public var funder: OrganizationOrPerson?
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    public var globalLocationNumber: String?
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    public var offerCatalog: OfferCatalog?
    /// Points-of-Sales operated by the organization or person.
    public var pointsOfSales: [Place]?
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
    /// The publishingPrinciples property indicates (typically via URL) a document describing the editorial principles of an Organization (or individual e.g. a Person writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a CreativeWork (e.g. NewsArticle) the principles are those of the party primarily responsible for the creation of the CreativeWork.
    /// While such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a funder) can be expressed using schema.org terminology.
    public var publishingPrinciples: CreativeWorkOrURL?
    /// A review of the item.
    public var reviews: [Review]?
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
    /// For an Organization (typically a NewsMediaOrganization), a statement about policy on use of unnamed sources and the decision process required.
    public var unnamedSourcesPolicy: CreativeWorkOrURL?
    /// The Value-added Tax ID of the organization or person.
    public var vatID: String?
    
    private enum CodingKeys: String, CodingKey {
        case actionableFeedbackPolicy
        case address
        case aggregateRating
        case alumni
        case areaSurved
        case awards = "award"
        case brands = "brands"
        case contactPoints = "contactPoint"
        case correctionsPolicy
        case department
        case dissolutionDate
        case diversityPolicy
        case duns
        case email
        case employees = "employee"
        case ethicsPolicy
        case events = "event"
        case faxNumber
        case founders = "founder"
        case foundingDate
        case foundingLocation
        case funder
        case globalLocationNumber
        case offerCatalog = "hasOfferCatalog"
        case pointsOfSales = "hasPOS"
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
        case publishingPrinciples
        case reviews = "review"
        case seeks
        case sponsor
        case subOrganization
        case taxID
        case telephone
        case unnamedSourcesPolicy
        case vatID
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.actionableFeedbackPolicy = try container.decodeCreativeWorkOrURLIfPresent(forKey: .actionableFeedbackPolicy)
        self.address = try container.decodePostalAddressOrTextIfPresent(forKey: .address)
        self.aggregateRating = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating)
        self.alumni = try container.decodeArrayOrElementIfPresent(SOPerson.self, forKey: .alumni)
        self.areaServed = try container.decodeIfPresent(String.self, forKey: .areaSurved)
        self.awards = try container.decodeArrayOrElementIfPresent(String.self, forKey: .awards)
        self.brands = try container.decodeBrandsOrOrganizationsIfPresent(forKey: .brands)
        self.contactPoints = try container.decodeArrayOrElementIfPresent(SOContactPoint.self, forKey: .contactPoints)
        self.correctionsPolicy = try container.decodeCreativeWorkOrURLIfPresent(forKey: .correctionsPolicy)
        self.department = try container.decodeIfPresent(SOOrganization.self, forKey: .department)
        self.dissolutionDate = try container.decodeDateOnlyIfPresent(forKey: .dissolutionDate)
        self.diversityPolicy = try container.decodeCreativeWorkOrURLIfPresent(forKey: .diversityPolicy)
        self.duns = try container.decodeIfPresent(String.self, forKey: .duns)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.employees = try container.decodeArrayOrElementIfPresent(SOPerson.self, forKey: .employees)
        self.ethicsPolicy = try container.decodeCreativeWorkOrURLIfPresent(forKey: .ethicsPolicy)
        self.events = try container.decodeArrayOrElementIfPresent(SOEvent.self, forKey: .events)
        self.faxNumber = try container.decodeIfPresent(String.self, forKey: .faxNumber)
        self.founders = try container.decodeArrayOrElementIfPresent(SOPerson.self, forKey: .founders)
        self.foundingDate = try container.decodeDateOnlyIfPresent(forKey: .foundingDate)
        self.foundingLocation = try container.decodeIfPresent(SOPlace.self, forKey: .foundingLocation)
        self.funder = try container.decodeOrganizationOrPersonIfPresent(forKey: .funder)
        self.globalLocationNumber = try container.decodeIfPresent(String.self, forKey: .globalLocationNumber)
        self.offerCatalog = try container.decodeIfPresent(SOOfferCatalog.self, forKey: .offerCatalog)
        self.pointsOfSales = try container.decodeArrayOrElementIfPresent(SOPlace.self, forKey: .pointsOfSales)
        self.isicV4 = try container.decodeIfPresent(String.self, forKey: .isicV4)
        self.legalName = try container.decodeIfPresent(String.self, forKey: .legalName)
        self.leiCode = try container.decodeIfPresent(String.self, forKey: .leiCode)
        self.location = try container.decodePlaceOrPostalAddressOrTextIfPresent(forKey: .location)
        self.logo = try container.decodeImageObjectOrURLIfPresent(forKey: .logo)
        self.makesOffers = try container.decodeArrayOrElementIfPresent(SOOffer.self, forKey: .makesOffers)
        self.member = try container.decodeOrganizationsOrPersonsIfPresent(forKey: .member)
        self.memberOf = try container.decodeOrganizationOrProgramMembershipIfPresent(forKey: .memberOf)
        self.naics = try container.decodeIfPresent(String.self, forKey: .naics)
        self.numberOfEmployees = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .numberOfEmployees)
        self.owns = try container.decodeOwnershipInfosOrProductsIfPresent(forKey: .owns)
        self.parentOrganization = try container.decodeIfPresent(SOOrganization.self, forKey: .parentOrganization)
        self.publishingPrinciples = try container.decodeCreativeWorkOrURLIfPresent(forKey: .publishingPrinciples)
        self.reviews = try container.decodeArrayOrElementIfPresent(SOReview.self, forKey: .reviews)
        self.seeks = try container.decodeArrayOrElementIfPresent(SODemand.self, forKey: .seeks)
        self.sponsor = try container.decodeOrganizationOrPersonIfPresent(forKey: .sponsor)
        self.subOrganization = try container.decodeIfPresent(SOOrganization.self, forKey: .subOrganization)
        self.taxID = try container.decodeIfPresent(String.self, forKey: .taxID)
        self.telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
        self.unnamedSourcesPolicy = try container.decodeCreativeWorkOrURLIfPresent(forKey: .unnamedSourcesPolicy)
        self.vatID = try container.decodeIfPresent(String.self, forKey: .vatID)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.actionableFeedbackPolicy, forKey: .actionableFeedbackPolicy)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(self.alumni, forKey: .alumni)
        try container.encodeIfPresent(self.areaServed, forKey: .areaSurved)
        try container.encodeIfPresent(self.awards, forKey: .awards)
        try container.encodeIfPresent(self.brands, forKey: .brands)
        try container.encodeIfPresent(self.contactPoints, forKey: .contactPoints)
        try container.encodeIfPresent(self.correctionsPolicy, forKey: .correctionsPolicy)
        try container.encodeIfPresent(self.department, forKey: .department)
        try container.encodeIfPresent(self.dissolutionDate, forKey: .dissolutionDate)
        try container.encodeIfPresent(self.diversityPolicy, forKey: .diversityPolicy)
        try container.encodeIfPresent(self.duns, forKey: .duns)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.employees, forKey: .employees)
        try container.encodeIfPresent(self.ethicsPolicy, forKey: .ethicsPolicy)
        try container.encodeIfPresent(self.events, forKey: .events)
        try container.encodeIfPresent(self.faxNumber, forKey: .faxNumber)
        try container.encodeIfPresent(self.founders, forKey: .founders)
        try container.encodeIfPresent(self.foundingDate, forKey: .foundingDate)
        try container.encodeIfPresent(self.foundingLocation, forKey: .foundingLocation)
        try container.encodeIfPresent(self.funder, forKey: .funder)
        try container.encodeIfPresent(self.globalLocationNumber, forKey: .globalLocationNumber)
        try container.encodeIfPresent(self.offerCatalog, forKey: .offerCatalog)
        try container.encodeIfPresent(self.pointsOfSales, forKey: .pointsOfSales)
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
        try container.encodeIfPresent(self.publishingPrinciples, forKey: .publishingPrinciples)
        try container.encodeIfPresent(self.reviews, forKey: .reviews)
        try container.encodeIfPresent(self.seeks, forKey: .seeks)
        try container.encodeIfPresent(self.sponsor, forKey: .sponsor)
        try container.encodeIfPresent(self.subOrganization, forKey: .subOrganization)
        try container.encodeIfPresent(self.taxID, forKey: .taxID)
        try container.encodeIfPresent(self.telephone, forKey: .telephone)
        try container.encodeIfPresent(self.unnamedSourcesPolicy, forKey: .unnamedSourcesPolicy)
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
