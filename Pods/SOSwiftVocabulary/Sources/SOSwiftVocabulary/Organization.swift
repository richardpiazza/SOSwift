import Foundation

public protocol OrganizationConformance:
                    EducationalOrganizationOrOrganization,
                    BrandOrOrganization,
                    OrganizationOrPerson,
                    OrganizationOrProgramMembership
                {}

/// An organization such as a school, NGO, corporation, club, etc.
public protocol Organization: Thing, OrganizationConformance {
    /// For a NewsMediaOrganization or other news-related Organization, a statement about public engagement activities (for news media, the newsroom’s), including involving the public - digitally or otherwise -- in coverage decisions, reporting and activities after publication.
    var actionableFeedbackPolicy: CreativeWorkOrURL? { get set }
    /// Physical address of the item.
    var address: PostalAddressOrText? { get set }
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    var aggregateRating: AggregateRating? { get set }
    /// Alumni of an organization.
    /// Inverse property: alumniOf.
    var alumni: [Person]? { get set }
    /// The geographic area where a service or offered item is provided.
    var areaServed: AreaServed? { get set }
    /// An award won by or for this item
    /// - schema.org property name: award
    var awards: [String]? { get set }
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    /// - schema.org property name: brand
    var brands: [BrandOrOrganization]? { get set }
    /// A contact point for a person or organization.
    /// - schema.org property name: contactPoint
    var contactPoints: [ContactPoint]? { get set }
    /// For an Organization (e.g. NewsMediaOrganization), a statement describing (in news media, the newsroom’s) disclosure and correction policy for errors.
    var correctionsPolicy: CreativeWorkOrURL? { get set }
    /// A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.
    var department: Organization? { get set }
    /// The date that this organization was dissolved.
    var dissolutionDate: DateOnly? { get set }
    /// Statement on diversity policy by an Organization e.g. a NewsMediaOrganization. For a NewsMediaOrganization, a statement describing the newsroom’s diversity policy on both staffing and sources, typically providing staffing data.
    var diversityPolicy: CreativeWorkOrURL? { get set }
    /// The Dun & Bradstreet DUNS number for identifying an organization or business person.
    var duns: String? { get set }
    /// Email address.
    var email: String? { get set }
    /// Someone working for this organization.
    /// - schema.org property name: employee
    var employees: [Person]? { get set }
    /// Statement about ethics policy, e.g. of a NewsMediaOrganization regarding journalistic and publishing practices, or of a Restaurant, a page describing food source policies. In the case of a NewsMediaOrganization, an ethicsPolicy is typically a statement describing the personal, organizational, and corporate standards of behavior expected by the organization.
    var ethicsPolicy: CreativeWorkOrURL? { get set }
    /// Upcoming or past event associated with this place, organization, or action.
    /// - schema.org property name: event
    var events: [Event]? { get set }
    /// The fax number.
    var faxNumber: String? { get set }
    /// A person who founded this organization.
    /// - schema.org property name: founder
    var founders: [Person]? { get set }
    /// The date that this organization was founded.
    var foundingDate: DateOnly? { get set }
    /// The place where the Organization was founded.
    var foundingLocation: Place? { get set }
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    var funder: OrganizationOrPerson? { get set }
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    var globalLocationNumber: String? { get set }
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    /// - schema.org property name: hasOfferCatalog
    var offerCatalog: OfferCatalog? { get set }
    /// Points-of-Sales operated by the organization or person.
    /// - schema.org property name: hasPOS
    var pointsOfSales: [Place]? { get set }
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
    var isicV4: String? { get set }
    /// The official name of the organization, e.g. the registered company name.
    var legalName: String? { get set }
    /// An organization identifier that uniquely identifies a legal entity as defined in ISO 17442.
    var leiCode: String? { get set }
    /// The location of for example where the event is happening, an organization is located, or where an action takes place.
    var location: PlaceOrPostalAddressOrText? { get set }
    /// An associated logo.
    var logo: ImageObjectOrURL? { get set }
    /// A pointer to products or services offered by the organization or person.
    /// Inverse property: offeredBy.
    var makesOffers: [Offer]? { get set }
    /// A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.
    /// Inverse property: memberOf.
    var member: [OrganizationOrPerson]? { get set }
    /// An Organization (or ProgramMembership) to which this Person or Organization belongs.
    /// Inverse property: member.
    var memberOf: OrganizationOrProgramMembership? { get set }
    /// The North American Industry Classification System (NAICS) code for a particular organization or business person.
    var naics: String? { get set }
    /// The number of employees in an organization e.g. business.
    var numberOfEmployees: QuantitativeValue? { get set }
    /// Products owned by the organization or person.
    var owns: [OwnershipInfoOrProduct]? { get set }
    /// The larger organization that this organization is a subOrganization of, if any.
    /// Inverse property: subOrganization.
    var parentOrganization: Organization? { get set }
    /// The publishingPrinciples property indicates (typically via URL) a document describing the editorial principles of an Organization (or individual e.g. a Person writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a CreativeWork (e.g. NewsArticle) the principles are those of the party primarily responsible for the creation of the CreativeWork.
    /// While such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a funder) can be expressed using schema.org terminology.
    var publishingPrinciples: CreativeWorkOrURL? { get set }
    /// A review of the item.
    /// - schema.org property name: review
    var reviews: [Review]? { get set }
    /// A pointer to products or services sought by the organization or person (demand).
    var seeks: [Demand]? { get set }
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    var sponsor: OrganizationOrPerson? { get set }
    /// A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific 'department' property.
    /// Inverse property: parentOrganization.
    var subOrganization: Organization? { get set }
    /// The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
    var taxID: String? { get set }
    /// The telephone number.
    var telephone: String? { get set }
    /// For an Organization (typically a NewsMediaOrganization), a statement about policy on use of unnamed sources and the decision process required.
    var unnamedSourcesPolicy: CreativeWorkOrURL? { get set }
    /// The Value-added Tax ID of the organization or person.
    var vatID: String? { get set }
}
