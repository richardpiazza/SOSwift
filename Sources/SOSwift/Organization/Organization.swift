import Foundation

/// An organization such as a school, NGO, corporation, club, etc.
public class Organization: Thing {

    /// For a NewsMediaOrganization or other news-related Organization, a
    /// statement about public engagement activities (for news media, the
    /// newsroom’s), including involving the public - digitally or otherwise -
    /// in coverage decisions, reporting and activities after publication.
    public var actionableFeedbackPolicy: CreativeWorkOrURL?

    /// Physical address of the item.
    public var address: PostalAddressOrText?

    /// The overall rating, based on a collection of reviews or ratings, of the
    /// item.
    public var aggregateRating: AggregateRating?

    /// Alumni of an organization.
    /// Inverse property: alumniOf.
    public var alumni: [Person]?

    /// The geographic area where a service or offered item is provided.
    public var areaServed: AreaServed?

    /// An award won by or for this item
    public var awards: [String]?

    /// The brand(s) associated with a product or service, or the brand(s)
    /// maintained by an organization or business person.
    public var brands: [BrandOrOrganization]?

    /// A contact point for a person or organization.
    public var contactPoints: [ContactPoint]?

    /// For an Organization (e.g. NewsMediaOrganization), a statement describing
    /// (in news media, the newsroom’s) disclosure and correction policy for
    /// errors.
    public var correctionsPolicy: CreativeWorkOrURL?

    /// A relationship between an organization and a department of that
    /// organization, also described as an organization (allowing different
    /// urls, logos, opening hours). For example: a store with a pharmacy, or a
    //// bakery with a cafe.
    public var department: Organization?

    /// Statement on diversity policy by an Organization e.g. a
    /// NewsMediaOrganization. For a NewsMediaOrganization, a statement
    /// describing the newsroom’s diversity policy on both staffing and sources,
    /// typically providing staffing data.
    public var diversityPolicy: CreativeWorkOrURL?

    /// The date that this organization was dissolved.
    public var dissolutionDate: DateOnly?

    /// The Dun & Bradstreet DUNS number for identifying an organization or
    /// business person.
    public var duns: String?

    /// Email address.
    public var email: String?

    /// Someone working for this organization.
    public var employees: [Person]?

    /// Statement about ethics policy, e.g. of a NewsMediaOrganization regarding
    /// journalistic and publishing practices, or of a Restaurant, a page
    /// describing food source policies. In the case of a NewsMediaOrganization,
    /// an ethicsPolicy is typically a statement describing the personal,
    /// organizational, and corporate standards of behavior expected by the
    /// organization.
    public var ethicsPolicy: CreativeWorkOrURL?

    /// Upcoming or past event associated with this place, organization, or
    /// action.
    public var events: [Event]?

    /// The fax number.
    public var faxNumber: String?

    /// A person who founded this organization.
    public var founders: [Person]?

    /// The date that this organization was founded.
    public var foundingDate: DateOnly?

    /// The place where the Organization was founded.
    public var foundingLocation: Place?

    /// A person or organization that supports (sponsors) something through some
    /// kind of financial contribution.
    public var funder: OrganizationOrPerson?

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

    /// The International Standard of Industrial Classification of All Economic
    /// Activities (ISIC), Revision 4 code for a particular organization,
    /// business person, or place.
    public var isicV4: String?

    /// The official name of the organization, e.g. the registered company name.
    public var legalName: String?

    /// An organization identifier that uniquely identifies a legal entity as
    /// defined in ISO 17442.
    public var leiCode: String?

    /// The location of for example where the event is happening, an
    /// organization is located, or where an action takes place.
    public var location: PlaceOrPostalAddressOrText?

    /// An associated logo.
    public var logo: ImageObjectOrURL?

    /// A pointer to products or services offered by the organization or person.
    /// Inverse property: offeredBy.
    public var makesOffers: [Offer]?

    /// A member of an Organization or a ProgramMembership. Organizations can be
    /// members of organizations; ProgramMembership is typically for
    /// individuals.
    /// - **Inverse property**: _memberOf_
    public var member: [OrganizationOrPerson]?

    /// An Organization (or ProgramMembership) to which this Person or
    /// Organization belongs.
    /// - **Inverse property**: _member_
    public var memberOf: OrganizationOrProgramMembership?

    /// The North American Industry Classification System (NAICS) code for a
    /// particular organization or business person.
    public var naics: String?

    /// The number of employees in an organization e.g. business.
    public var numberOfEmployees: QuantitativeValue?

    /// Products owned by the organization or person.
    public var owns: [OwnershipInfoOrProduct]?

    /// The larger organization that this organization is a subOrganization of,
    /// if any.
    /// - **Inverse property**: _subOrganization_
    public var parentOrganization: Organization?

    /// The publishingPrinciples property indicates (typically via URL) a
    /// document describing the editorial principles of an Organization (or
    /// individual e.g. a Person writing a blog) that relate to their activities
    /// as a publisher, e.g. ethics or diversity policies. When applied to a
    /// CreativeWork (e.g. NewsArticle) the principles are those of the party
    /// primarily responsible for the creation of the CreativeWork.
    ///
    /// While such policies are most typically expressed in natural language,
    /// sometimes related information (e.g. indicating a funder) can be
    /// expressed using schema.org terminology.
    public var publishingPrinciples: CreativeWorkOrURL?

    /// A review of the item.
    public var reviews: [Review]?

    /// A pointer to products or services sought by the organization or person
    /// (demand).
    public var seeks: [Demand]?

    /// A person or organization that supports a thing through a pledge,
    /// promise, or financial contribution. e.g. a sponsor of a Medical Study or
    /// a corporate sponsor of an event.
    public var sponsor: OrganizationOrPerson?

    /// A relationship between two organizations where the first includes the
    /// second, e.g., as a subsidiary. See also: the more specific 'department'
    /// property.
    /// - **Inverse property**: _parentOrganization_
    public var subOrganization: Organization?

    /// The Tax / Fiscal ID of the organization or person, e.g. the TIN in the
    /// US or the CIF/NIF in Spain.
    public var taxID: String?

    /// The telephone number.
    public var telephone: String?

    /// For an Organization (typically a NewsMediaOrganization), a statement
    /// about policy on use of unnamed sources and the decision process
    /// required.
    public var unnamedSourcesPolicy: CreativeWorkOrURL?

    /// The Value-added Tax ID of the organization or person.
    public var vatID: String?

    enum OrganizationCodingKeys: String, CodingKey {
        case actionableFeedbackPolicy
        case address
        case aggregateRating
        case alumni
        case areaServed
        case awards = "award"
        case brands
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

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: OrganizationCodingKeys.self)

        actionableFeedbackPolicy = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .actionableFeedbackPolicy)
        address = try container.decodeIfPresent(PostalAddressOrText.self, forKey: .address)
        aggregateRating = try container.decodeIfPresent(AggregateRating.self, forKey: .aggregateRating)
        alumni = try container.decodeIfPresent([Person].self, forKey: .alumni)
        areaServed = try container.decodeIfPresent(AreaServed.self, forKey: .areaServed)
        awards = try container.decodeIfPresent([String].self, forKey: .awards)
        brands = try container.decodeIfPresent([BrandOrOrganization].self, forKey: .brands)
        contactPoints = try container.decodeIfPresent([ContactPoint].self, forKey: .contactPoints)
        correctionsPolicy = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .correctionsPolicy)
        department = try container.decodeIfPresent(Organization.self, forKey: .department)
        diversityPolicy = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .diversityPolicy)
        dissolutionDate = try container.decodeIfPresent(DateOnly.self, forKey: .dissolutionDate)
        duns = try container.decodeIfPresent(String.self, forKey: .duns)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        employees = try container.decodeIfPresent([Person].self, forKey: .employees)
        ethicsPolicy = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .ethicsPolicy)
        events = try container.decodeIfPresent([Event].self, forKey: .events)
        faxNumber = try container.decodeIfPresent(String.self, forKey: .faxNumber)
        founders = try container.decodeIfPresent([Person].self, forKey: .founders)
        foundingDate = try container.decodeIfPresent(DateOnly.self, forKey: .foundingDate)
        foundingLocation = try container.decodeIfPresent(Place.self, forKey: .foundingLocation)
        funder = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .funder)
        globalLocationNumber = try container.decodeIfPresent(String.self, forKey: .globalLocationNumber)
        offerCatalog = try container.decodeIfPresent(OfferCatalog.self, forKey: .offerCatalog)
        pointsOfSales = try container.decodeIfPresent([Place].self, forKey: .pointsOfSales)
        isicV4 = try container.decodeIfPresent(String.self, forKey: .isicV4)
        legalName = try container.decodeIfPresent(String.self, forKey: .legalName)
        leiCode = try container.decodeIfPresent(String.self, forKey: .leiCode)
        location = try container.decodeIfPresent(PlaceOrPostalAddressOrText.self, forKey: .location)
        logo = try container.decodeIfPresent(ImageObjectOrURL.self, forKey: .logo)
        makesOffers = try container.decodeIfPresent([Offer].self, forKey: .makesOffers)
        member = try container.decodeIfPresent([OrganizationOrPerson].self, forKey: .member)
        memberOf = try container.decodeIfPresent(OrganizationOrProgramMembership.self, forKey: .memberOf)
        naics = try container.decodeIfPresent(String.self, forKey: .naics)
        numberOfEmployees = try container.decodeIfPresent(QuantitativeValue.self, forKey: .numberOfEmployees)
        owns = try container.decodeIfPresent([OwnershipInfoOrProduct].self, forKey: .owns)
        parentOrganization = try container.decodeIfPresent(Organization.self, forKey: .parentOrganization)
        publishingPrinciples = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .publishingPrinciples)
        reviews = try container.decodeIfPresent([Review].self, forKey: .reviews)
        seeks = try container.decodeIfPresent([Demand].self, forKey: .seeks)
        sponsor = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .sponsor)
        subOrganization = try container.decodeIfPresent(Organization.self, forKey: .subOrganization)
        taxID = try container.decodeIfPresent(String.self, forKey: .taxID)
        telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
        unnamedSourcesPolicy = try container.decodeIfPresent(CreativeWorkOrURL.self, forKey: .unnamedSourcesPolicy)
        vatID = try container.decodeIfPresent(String.self, forKey: .vatID)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: OrganizationCodingKeys.self)

        try container.encodeIfPresent(actionableFeedbackPolicy, forKey: .actionableFeedbackPolicy)
        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(alumni, forKey: .alumni)
        try container.encodeIfPresent(areaServed, forKey: .areaServed)
        try container.encodeIfPresent(awards, forKey: .awards)
        try container.encodeIfPresent(brands, forKey: .brands)
        try container.encodeIfPresent(contactPoints, forKey: .contactPoints)
        try container.encodeIfPresent(correctionsPolicy, forKey: .correctionsPolicy)
        try container.encodeIfPresent(department, forKey: .department)
        try container.encodeIfPresent(dissolutionDate, forKey: .dissolutionDate)
        try container.encodeIfPresent(diversityPolicy, forKey: .diversityPolicy)
        try container.encodeIfPresent(duns, forKey: .duns)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(employees, forKey: .employees)
        try container.encodeIfPresent(ethicsPolicy, forKey: .ethicsPolicy)
        try container.encodeIfPresent(events, forKey: .events)
        try container.encodeIfPresent(faxNumber, forKey: .faxNumber)
        try container.encodeIfPresent(founders, forKey: .founders)
        try container.encodeIfPresent(foundingDate, forKey: .foundingDate)
        try container.encodeIfPresent(foundingLocation, forKey: .foundingLocation)
        try container.encodeIfPresent(funder, forKey: .funder)
        try container.encodeIfPresent(globalLocationNumber, forKey: .globalLocationNumber)
        try container.encodeIfPresent(offerCatalog, forKey: .offerCatalog)
        try container.encodeIfPresent(pointsOfSales, forKey: .pointsOfSales)
        try container.encodeIfPresent(isicV4, forKey: .isicV4)
        try container.encodeIfPresent(legalName, forKey: .legalName)
        try container.encodeIfPresent(leiCode, forKey: .leiCode)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(logo, forKey: .logo)
        try container.encodeIfPresent(makesOffers, forKey: .makesOffers)
        try container.encodeIfPresent(member, forKey: .member)
        try container.encodeIfPresent(memberOf, forKey: .memberOf)
        try container.encodeIfPresent(naics, forKey: .naics)
        try container.encodeIfPresent(numberOfEmployees, forKey: .numberOfEmployees)
        try container.encodeIfPresent(owns, forKey: .owns)
        try container.encodeIfPresent(parentOrganization, forKey: .parentOrganization)
        try container.encodeIfPresent(publishingPrinciples, forKey: .publishingPrinciples)
        try container.encodeIfPresent(reviews, forKey: .reviews)
        try container.encodeIfPresent(seeks, forKey: .seeks)
        try container.encodeIfPresent(sponsor, forKey: .sponsor)
        try container.encodeIfPresent(subOrganization, forKey: .subOrganization)
        try container.encodeIfPresent(taxID, forKey: .taxID)
        try container.encodeIfPresent(telephone, forKey: .telephone)
        try container.encodeIfPresent(unnamedSourcesPolicy, forKey: .unnamedSourcesPolicy)
        try container.encodeIfPresent(vatID, forKey: .vatID)

        try super.encode(to: encoder)
    }
}
