import Foundation

public protocol SchemaOrganizationDataTypeConformance:
                    EducationalOrganizationOrOrganization,
                    BrandOrOrganization,
                    OrganizationOrPerson,
                    OrganizationOrProgramMembership {}

public protocol Organization: Thing, SchemaOrganizationDataTypeConformance {
    var address: PostalAddressOrText? { get set }
    var aggregateRating: AggregateRating? { get set }
    var alumni: [Person]? { get set }
    var areaServed: AdministrativeAreaOrGeoShapeOrPlaceOrText? { get set }
    var award: String? { get set }
    var brand: BrandOrOrganization? { get set }
    var contactPoint: ContactPoint? { get set }
    var department: Organization? { get set }
    var dissolutionDate: DateOnly? { get set }
    var duns: String? { get set }
    var email: String? { get set }
    var employee: [Person]? { get set }
    var event: Event? { get set }
    var faxNumber: String? { get set }
    var founder: Person? { get set }
    var foundingDate: DateOnly? { get set }
    var foundingLocation: Place? { get set }
    var funder: OrganizationOrPerson? { get set }
    var globalLocationNumber: String? { get set }
    var hasOfferCatalog: OfferCatalog? { get set }
    var hasPOS: Place? { get set }
    var isicV4: String? { get set }
    var legalName: String? { get set }
    var leiCode: String? { get set }
    var location: PlaceOrPostalAddressOrText? { get set }
    var logo: ImageObjectOrURL? { get set }
    var makesOffers: [Offer]? { get set }
    var member: OrganizationOrPerson? { get set }
    var memberOf: OrganizationOrProgramMembership? { get set }
    var naics: String? { get set }
    var numberOfEmployees: QuantitativeValue? { get set }
    var owns: OwnershipInfoOrProduct? { get set }
    var parentOrganization: Organization? { get set }
    var review: Review? { get set }
    var seeks: [Demand]? { get set }
    var sponsor: OrganizationOrPerson? { get set }
    var subOrganization: Organization? { get set }
    var taxID: String? { get set }
    var telephone: String? { get set }
    var vatID: String? { get set }
}
