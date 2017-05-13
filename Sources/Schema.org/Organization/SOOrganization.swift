import Foundation

public protocol SchemaOrganizationDataTypeConformance:
                    SchemaEducationalOrganizationOrOrganization,
                    SchemaBrandOrOrganization,
                    SchemaOrganizationOrPerson,
                    SchemaOrganizationOrProgramMembership {}

public protocol SchemaOrganization: SchemaThing, SchemaOrganizationDataTypeConformance {
    var address: SchemaPostalAddressOrText? { get set }
    var aggregateRating: SchemaAggregateRating? { get set }
    var alumni: [SchemaPerson]? { get set }
    var areaServed: SchemaAdministrativeAreaOrGeoShapeOrPlaceOrText? { get set }
    var award: String? { get set }
    var brand: SchemaBrandOrOrganization? { get set }
    var contactPoint: SchemaContactPoint? { get set }
    var department: SchemaOrganization? { get set }
    var dissolutionDate: SchemaDate? { get set }
    var duns: String? { get set }
    var email: String? { get set }
    var employee: [SchemaPerson]? { get set }
    var event: SchemaEvent? { get set }
    var faxNumber: String? { get set }
    var founder: SchemaPerson? { get set }
    var foundingDate: SchemaDate? { get set }
    var foundingLocation: SchemaPlace? { get set }
    var funder: SchemaOrganizationOrPerson? { get set }
    var globalLocationNumber: String? { get set }
    var hasOfferCatalog: OfferCatalog? { get set }
    var hasPOS: SchemaPlace? { get set }
    var isicV4: String? { get set }
    var legalName: String? { get set }
    var leiCode: String? { get set }
    var location: SchemaPlaceOrPostalAddressOrText? { get set }
    var logo: SchemaImageObjectOrURL? { get set }
    var makesOffers: [SchemaOffer]? { get set }
    var member: SchemaOrganizationOrPerson? { get set }
    var memberOf: SchemaOrganizationOrProgramMembership? { get set }
    var naics: String? { get set }
    var numberOfEmployees: QuantitativeValue? { get set }
    var owns: SchemaOwnershipInfoOrProduct? { get set }
    var parentOrganization: SchemaOrganization? { get set }
    var review: SchemaReview? { get set }
    var seeks: [SchemaDemand]? { get set }
    var sponsor: SchemaOrganizationOrPerson? { get set }
    var subOrganization: SchemaOrganization? { get set }
    var taxID: String? { get set }
    var telephone: String? { get set }
    var vatID: String? { get set }
}
