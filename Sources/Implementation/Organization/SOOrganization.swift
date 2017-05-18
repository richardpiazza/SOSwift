import Foundation

public class SOOrganization: SOThing, Organization {
    override public class var type: String {
        return "Organization"
    }
    
    public var address: PostalAddressOrText?
    public var aggregateRating: AggregateRating?
    public var alumni: [Person]?
    public var areaServed: AreaServed?
    public var award: [String]?
    public var brand: [BrandOrOrganization]?
    public var contactPoint: [ContactPoint]?
    public var department: Organization?
    public var dissolutionDate: DateOnly?
    public var duns: String?
    public var email: String?
    public var employee: [Person]?
    public var event: [Event]?
    public var faxNumber: String?
    public var founder: [Person]?
    public var foundingDate: DateOnly?
    public var foundingLocation: Place?
    public var funder: OrganizationOrPerson?
    public var globalLocationNumber: String?
    public var hasOfferCatalog: OfferCatalog?
    public var hasPOS: [Place]?
    public var isicV4: String?
    public var legalName: String?
    public var leiCode: String?
    public var location: PlaceOrPostalAddressOrText?
    public var logo: ImageObjectOrURL?
    public var makesOffers: [Offer]?
    public var member: [OrganizationOrPerson]?
    public var memberOf: OrganizationOrProgramMembership?
    public var naics: String?
    public var numberOfEmployees: QuantitativeValue?
    public var owns: [OwnershipInfoOrProduct]?
    public var parentOrganization: Organization?
    public var review: [Review]?
    public var seeks: [Demand]?
    public var sponsor: OrganizationOrPerson?
    public var subOrganization: Organization?
    public var taxID: String?
    public var telephone: String?
    public var vatID: String?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        
        return dictionary
    }
}
