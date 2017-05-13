import Foundation

public class Organization: Thing, SchemaOrganization {
    override public var type: String {
        return "Organization"
    }
    
    public var address: SchemaPostalAddressOrText?
    public var aggregateRating: SchemaAggregateRating?
    public var alumni: [SchemaPerson]?
    public var areaServed: SchemaAdministrativeAreaOrGeoShapeOrPlaceOrText?
    public var award: String?
    public var brand: SchemaBrandOrOrganization?
    public var contactPoint: SchemaContactPoint?
    public var department: SchemaOrganization?
    public var dissolutionDate: SchemaDate?
    public var duns: String?
    public var email: String?
    public var employee: [SchemaPerson]?
    public var event: SchemaEvent?
    public var faxNumber: String?
    public var founder: SchemaPerson?
    public var foundingDate: SchemaDate?
    public var foundingLocation: SchemaPlace?
    public var funder: SchemaOrganizationOrPerson?
    public var globalLocationNumber: String?
    public var hasOfferCatalog: OfferCatalog?
    public var hasPOS: SchemaPlace?
    public var isicV4: String?
    public var legalName: String?
    public var leiCode: String?
    public var location: SchemaPlaceOrPostalAddressOrText?
    public var logo: SchemaImageObjectOrURL?
    public var makesOffers: [SchemaOffer]?
    public var member: SchemaOrganizationOrPerson?
    public var memberOf: SchemaOrganizationOrProgramMembership?
    public var naics: String?
    public var numberOfEmployees: QuantitativeValue?
    public var owns: SchemaOwnershipInfoOrProduct?
    public var parentOrganization: SchemaOrganization?
    public var review: SchemaReview?
    public var seeks: [SchemaDemand]?
    public var sponsor: SchemaOrganizationOrPerson?
    public var subOrganization: SchemaOrganization?
    public var taxID: String?
    public var telephone: String?
    public var vatID: String?
}
