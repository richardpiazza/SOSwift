import Foundation

public protocol OrganizationConformance:
                    EducationalOrganizationOrOrganization,
                    BrandOrOrganization,
                    OrganizationOrPerson,
                    OrganizationOrProgramMembership {}

/// An organization such as a school, NGO, corporation, club, etc.
public protocol Organization: Thing, OrganizationConformance {
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
    var award: [String]? { get set }
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    var brand: [BrandOrOrganization]? { get set }
    /// A contact point for a person or organization.
    var contactPoint: [ContactPoint]? { get set }
    /// A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.
    var department: Organization? { get set }
    /// The date that this organization was dissolved.
    var dissolutionDate: DateOnly? { get set }
    /// The Dun & Bradstreet DUNS number for identifying an organization or business person.
    var duns: String? { get set }
    /// Email address.
    var email: String? { get set }
    /// Someone working for this organization.
    var employee: [Person]? { get set }
    /// Upcoming or past event associated with this place, organization, or action.
    var event: [Event]? { get set }
    /// The fax number.
    var faxNumber: String? { get set }
    /// A person who founded this organization.
    var founder: [Person]? { get set }
    /// The date that this organization was founded.
    var foundingDate: DateOnly? { get set }
    /// The place where the Organization was founded.
    var foundingLocation: Place? { get set }
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    var funder: OrganizationOrPerson? { get set }
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    var globalLocationNumber: String? { get set }
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    var hasOfferCatalog: OfferCatalog? { get set }
    /// Points-of-Sales operated by the organization or person.
    var hasPOS: [Place]? { get set }
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
    /// A review of the item.
    var review: [Review]? { get set }
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
    /// The Value-added Tax ID of the organization or person.
    var vatID: String? { get set }
}
