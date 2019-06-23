import Foundation

/// A service provided by an organization, e.g. delivery service, print services, etc.
public class Service: Intangible {
    
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    
    /// The geographic area where a service or offered item is provided.
    public var areaServed: AreaServed?
    
    /// An intended audience, i.e. a group for whom something was created.
    public var audience: Audience?
    
    /// A means of accessing the service (e.g. a phone bank, a web site, a location, etc.).
    public var availableChannel: ServiceChannel?
    
    /// An award won by or for this item.
    public var awards: [String]?
    
    /// The brand(s) associated with a product or service, or the brand(s) maintained
    /// by an organization or business person.
    public var brands: [BrandOrOrganization]?
    
    /// An entity that arranges for an exchange between a buyer and a seller. In most
    /// cases a broker never acquires or releases ownership of a product or service
    /// involved in an exchange. If it is not clear whether an entity is a broker, seller,
    /// or buyer, the latter two terms are preferred.
    public var broker: OrganizationOrPerson?
    
    /// A category for the item. Greater signs or slashes can be used to informally
    /// indicate a category hierarchy.
    public var category: PhysicalActivityCategoryOrThingOrText?
    
    /// Indicates an OfferCatalog listing for this Organization, Person, or Service.
    public var offerCatalog: OfferCatalog?
    
    /// The hours during which this service or contact is available.
    public var hoursAvailable: [OpeningHoursSpecification]?
    
    /// A pointer to another, somehow related product (or multiple products).
    public var relatedTo: [ProductOrService]?
    
    /// A pointer to another, functionally similar product (or multiple products).
    public var similarTo: [ProductOrService]?
    
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    
    /// An offer to provide this item—for example, an offer to sell a product, rent the
    /// DVD of a movie, perform a service, or give away tickets to an event.
    public var offers: [Offer]?
    
    /// The service provider, service operator, or service performer; the goods producer.
    /// Another party (a seller) may offer those services or goods on behalf of the provider.
    /// A provider may also serve as the seller.
    public var provider: OrganizationOrPerson?
    
    /// Indicates the mobility of a provided service (e.g. 'static', 'dynamic').
    public var providerMobility: String?
    
    /// A review of the item.
    public var reviews: [Review]?
    
    /// The tangible thing generated by the service, e.g. a passport, permit, etc.
    public var serviceOutput: Thing?
    
    /// The type of service being offered, e.g. veterans' benefits, emergency relief, etc.
    public var serviceType: String?
    
    /// Human-readable terms of service documentation.
    public var termsOfService: String?
    
    private enum CodingKeys: String, CodingKey {
        case aggregateRating
        case areaServed
        case audience
        case availableChannel
        case awards = "award"
        case brands = "brand"
        case broker
        case category
        case offerCatalog = "hasOfferCatalog"
        case hoursAvailable
        case relatedTo = "isRelatedTo"
        case similarTo = "isSimilarTo"
        case logo
        case offers
        case provider
        case providerMobility
        case reviews = "review"
        case serviceOutput
        case serviceType
        case termsOfService
    }
    
}
