import Foundation

public class Organization: SOThing, SchemaOrganization {
    override public class var type: String {
        return "Organization"
    }
    
    public var address: PostalAddressOrText?
    public var aggregateRating: SchemaAggregateRating?
    public var alumni: [SchemaPerson]?
    public var areaServed: AdministrativeAreaOrGeoShapeOrPlaceOrText?
    public var award: String?
    public var brand: BrandOrOrganization?
    public var contactPoint: SchemaContactPoint?
    public var department: SchemaOrganization?
    public var dissolutionDate: DateOnly?
    public var duns: String?
    public var email: String?
    public var employee: [SchemaPerson]?
    public var event: SchemaEvent?
    public var faxNumber: String?
    public var founder: SchemaPerson?
    public var foundingDate: DateOnly?
    public var foundingLocation: SchemaPlace?
    public var funder: OrganizationOrPerson?
    public var globalLocationNumber: String?
    public var hasOfferCatalog: OfferCatalog?
    public var hasPOS: SchemaPlace?
    public var isicV4: String?
    public var legalName: String?
    public var leiCode: String?
    public var location: PlaceOrPostalAddressOrText?
    public var logo: ImageObjectOrURL?
    public var makesOffers: [SchemaOffer]?
    public var member: OrganizationOrPerson?
    public var memberOf: OrganizationOrProgramMembership?
    public var naics: String?
    public var numberOfEmployees: QuantitativeValue?
    public var owns: OwnershipInfoOrProduct?
    public var parentOrganization: SchemaOrganization?
    public var review: SchemaReview?
    public var seeks: [SchemaDemand]?
    public var sponsor: OrganizationOrPerson?
    public var subOrganization: SchemaOrganization?
    public var taxID: String?
    public var telephone: String?
    public var vatID: String?
}
