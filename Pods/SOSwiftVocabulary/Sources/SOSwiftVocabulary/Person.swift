import Foundation

public protocol PersonConformance:
                    PersonOrURL,
                    OrganizationOrPerson,
                    MusicGroupOrPerson
                {}

/// A person (alive, dead, undead, or fictional).
public protocol Person: Thing, PersonConformance {
    /// An additional name for a Person, can be used for a middle name.
    var additionalName: String? { get set }
    /// Physical address of the item.
    var address: PostalAddressOrText? { get set }
    /// An organization that this person is affiliated with. For example, a school/university, a club, or a team.
    var affiliation: Organization? { get set }
    /// An organization that the person is an alumni of.
    /// Inverse property: alumni.
    var alumniOf: EducationalOrganizationOrOrganization? { get set }
    /// An award won by or for this item.
    /// - schema.org property name: award
    var awards: [String]? { get set }
    /// Date of birth.
    var birthDate: DateOnly? { get set }
    /// The place where the person was born.
    var birthPlace: Place? { get set }
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    /// - schema.org property name: brand
    var brands: [BrandOrOrganization]? { get set }
    /// A child of the person.
    var children: [Person]? { get set }
    /// A colleague of the person.
    /// - schema.org property name: colleague
    var colleagues: [PersonOrURL]? { get set }
    /// A contact point for a person or organization.
    /// - schema.org property name: contactPoint
    var contactPoints: [ContactPoint]? { get set }
    /// Date of death.
    var deathDate: DateOnly? { get set }
    /// The place where the person died.
    var deathPlace: Place? { get set }
    /// The Dun & Bradstreet DUNS number for identifying an organization or business person.
    var duns: String? { get set }
    /// Email address.
    var email: String? { get set }
    /// Family name. In the U.S., the last name of an Person. This can be used along with givenName instead of the name property.
    var familyName: String? { get set }
    /// The fax number.
    var faxNumber: String? { get set }
    /// The most generic uni-directional social relation.
    var follows: [Person]? { get set }
    /// A person or organization that supports (sponsors) something through some kind of financial contribution.
    var funder: OrganizationOrPerson? { get set }
    /// Gender of the person. While http://schema.org/Male and http://schema.org/Female may be used, text strings are also acceptable for people who do not identify as a binary gender.
    var gender: GenderOrText? { get set }
    /// Given name. In the U.S., the first name of a Person. This can be used along with familyName instead of the name property.
    var givenName: String? { get set }
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    var globalLocationNumber: String? { get set }
    /// The Person's occupation. For past professions, use Role for expressing dates.
    /// - chema.org property name: hasOccupation
    var occupation: Occupation? { get set }
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    /// - schema.org property name: hasOfferCatalog
    var offerCatalog: OfferCatalog? { get set }
    /// Points-of-Sales operated by the organization or person.
    /// - schema.org property name: hasPOS
    var pointsOfSales: [Place]? { get set }
    /// The height of the item.
    var height: DistanceOrQuantitativeValue? { get set }
    /// A contact location for a person's residence.
    var homeLocation: ContactPointOrPlace? { get set }
    /// An honorific prefix preceding a Person's name such as Dr/Mrs/Mr.
    var honorificPrefix: String? { get set }
    /// An honorific suffix preceding a Person's name such as M.D. /PhD/MSCSW.
    var honorificSuffix: String? { get set }
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
    var isicV4: String? { get set }
    /// The job title of the person (for example, Financial Manager).
    var jobTitle: String? { get set }
    /// The most generic bi-directional social/work relation.
    var knows: [Person]? { get set }
    /// A pointer to products or services offered by the organization or person.
    /// Inverse property: offeredBy.
    var makesOffer: [Offer]? { get set }
    /// An Organization (or ProgramMembership) to which this Person or Organization belongs.
    /// Inverse property: member.
    var memberOf: [OrganizationOrProgramMembership]? { get set }
    /// The North American Industry Classification System (NAICS) code for a particular organization or business person.
    var naics: String? { get set }
    /// Nationality of the person.
    var nationality: Country? { get set }
    /// The total financial value of the person as calculated by subtracting assets from liabilities.
    var netWorth: MonetaryAmountOrPriceSpecification? { get set }
    /// Products owned by the organization or person.
    var owns: [ProductOrService]? { get set }
    /// A parent of this person.
    /// - schema.org property name: parent
    var parents: [Person]? { get set }
    /// Event that this person is a performer or participant in.
    var performerIn: Event? { get set }
    /// The publishingPrinciples property indicates (typically via URL) a document describing the editorial principles of an Organization (or individual e.g. a Person writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a CreativeWork (e.g. NewsArticle) the principles are those of the party primarily responsible for the creation of the CreativeWork.
    /// While such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a funder) can be expressed using schema.org terminology.
    var publishingPrinciples: CreativeWorkOrURL? { get set }
    /// The most generic familial relation.
    var relatedTo: [Person]? { get set }
    /// A pointer to products or services sought by the organization or person (demand).
    var seeks: [Demand]? { get set }
    /// A sibling of the person.
    /// - schema.org property name: sibling
    var siblings: [Person]? { get set }
    /// A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.
    var sponsor: OrganizationOrPerson? { get set }
    /// The person's spouse.
    var spouse: Person? { get set }
    /// The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
    var taxID: String? { get set }
    /// The telephone number.
    var telephone: String? { get set }
    /// The Value-added Tax ID of the organization or person.
    var vatID: String? { get set }
    /// The weight of the product or person.
    var weight: QuantitativeValue? { get set }
    /// A contact location for a person's place of work.
    var workLocation: ContactPointOrPlace? { get set }
    /// Organizations that the person works for.
    var worksFor: [Organization]? { get set }
}
