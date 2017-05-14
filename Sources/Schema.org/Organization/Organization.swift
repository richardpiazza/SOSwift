import Foundation

public protocol SchemaOrganizationDataTypeConformance:
                    EducationalOrganizationOrOrganization,
                    BrandOrOrganization,
                    OrganizationOrPerson,
                    OrganizationOrProgramMembership {}

public protocol SchemaOrganization: Thing, SchemaOrganizationDataTypeConformance {
    var address: PostalAddressOrText? { get set }
    var aggregateRating: SchemaAggregateRating? { get set }
    var alumni: [SchemaPerson]? { get set }
    var areaServed: AdministrativeAreaOrGeoShapeOrPlaceOrText? { get set }
    var award: String? { get set }
    var brand: BrandOrOrganization? { get set }
    var contactPoint: SchemaContactPoint? { get set }
    var department: SchemaOrganization? { get set }
    var dissolutionDate: DateOnly? { get set }
    var duns: String? { get set }
    var email: String? { get set }
    var employee: [SchemaPerson]? { get set }
    var event: SchemaEvent? { get set }
    var faxNumber: String? { get set }
    var founder: SchemaPerson? { get set }
    var foundingDate: DateOnly? { get set }
    var foundingLocation: SchemaPlace? { get set }
    var funder: OrganizationOrPerson? { get set }
    var globalLocationNumber: String? { get set }
    var hasOfferCatalog: OfferCatalog? { get set }
    var hasPOS: SchemaPlace? { get set }
    var isicV4: String? { get set }
    var legalName: String? { get set }
    var leiCode: String? { get set }
    var location: PlaceOrPostalAddressOrText? { get set }
    var logo: ImageObjectOrURL? { get set }
    var makesOffers: [SchemaOffer]? { get set }
    var member: OrganizationOrPerson? { get set }
    var memberOf: OrganizationOrProgramMembership? { get set }
    var naics: String? { get set }
    var numberOfEmployees: QuantitativeValue? { get set }
    var owns: OwnershipInfoOrProduct? { get set }
    var parentOrganization: SchemaOrganization? { get set }
    var review: SchemaReview? { get set }
    var seeks: [SchemaDemand]? { get set }
    var sponsor: OrganizationOrPerson? { get set }
    var subOrganization: SchemaOrganization? { get set }
    var taxID: String? { get set }
    var telephone: String? { get set }
    var vatID: String? { get set }
}
