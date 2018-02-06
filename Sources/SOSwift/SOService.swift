import Foundation
import SOSwiftVocabulary

/// A service provided by an organization, e.g. delivery service, print services, etc.
public class SOService: SOIntangible, Service {
    
    public override class var type: String {
        return "Service"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOBroadcastService.self
        ]
    }
    
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
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    public var brands: [BrandOrOrganization]?
    /// An entity that arranges for an exchange between a buyer and a seller. In most cases a broker never acquires or releases ownership of a product or service involved in an exchange. If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred.
    public var broker: OrganizationOrPerson?
    /// A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.
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
    /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event.
    public var offers: [Offer]?
    /// The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.aggregateRating = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating)
        self.areaServed = try container.decodeIfPresent(String.self, forKey: .areaServed)
        self.audience = try container.decodeIfPresent(SOAudience.self, forKey: .audience)
        self.availableChannel = try container.decodeIfPresent(SOServiceChannel.self, forKey: .availableChannel)
        self.awards = try container.decodeArrayOrElementIfPresent(String.self, forKey: .awards)
        self.brands = try container.decodeBrandsOrOrganizationsIfPresent(forKey: .brands)
        self.broker = try container.decodeOrganizationOrPersonIfPresent(forKey: .broker)
        self.category = try container.decodePhysicalActivityCategoryOrThingOrTextIfPresent(forKey: .category)
        self.offerCatalog = try container.decodeIfPresent(SOOfferCatalog.self, forKey: .offerCatalog)
        self.hoursAvailable = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .hoursAvailable)
        self.relatedTo = try container.decodeProductsOrServicesIfPresent(forKey: .relatedTo)
        self.similarTo = try container.decodeProductsOrServicesIfPresent(forKey: .similarTo)
        self.logo = try container.decodeImageObjectOrURLIfPresent(forKey: .logo)
        self.offers = try container.decodeIfPresent([SOOffer].self, forKey: .offers)
        self.provider = try container.decodeOrganizationOrPersonIfPresent(forKey: .provider)
        self.providerMobility = try container.decodeIfPresent(String.self, forKey: .providerMobility)
        self.reviews = try container.decodeArrayOrElementIfPresent(SOReview.self, forKey: .reviews)
        self.serviceOutput = try container.decodeIfPresent(SOThing.self, forKey: .serviceOutput)
        self.serviceType = try container.decodeIfPresent(String.self, forKey: .serviceType)
        self.termsOfService = try container.decodeIfPresent(String.self, forKey: .termsOfService)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(self.areaServed, forKey: .areaServed)
        try container.encodeIfPresent(self.audience, forKey: .audience)
        try container.encodeIfPresent(self.availableChannel, forKey: .availableChannel)
        try container.encodeIfPresent(self.awards, forKey: .awards)
        try container.encodeIfPresent(self.brands, forKey: .brands)
        try container.encodeIfPresent(self.broker, forKey: .broker)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.offerCatalog, forKey: .offerCatalog)
        try container.encodeIfPresent(self.hoursAvailable, forKey: .hoursAvailable)
        try container.encodeIfPresent(self.relatedTo, forKey: .relatedTo)
        try container.encodeIfPresent(self.similarTo, forKey: .similarTo)
        try container.encodeIfPresent(self.logo, forKey: .logo)
        try container.encodeIfPresent(self.offers, forKey: .offers)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.providerMobility, forKey: .providerMobility)
        try container.encodeIfPresent(self.reviews, forKey: .reviews)
        try container.encodeIfPresent(self.serviceOutput, forKey: .serviceOutput)
        try container.encodeIfPresent(self.serviceType, forKey: .serviceType)
        try container.encodeIfPresent(self.termsOfService, forKey: .termsOfService)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.aggregateRating.rawValue:
            return "The overall rating, based on a collection of reviews or ratings, of the item."
        case CodingKeys.areaServed.rawValue:
            return "The geographic area where a service or offered item is provided."
        case CodingKeys.audience.rawValue:
            return "An intended audience."
        case CodingKeys.availableChannel.rawValue:
            return "A means of accessing the service."
        case String(describing: CodingKeys.awards):
            return "An award won by or for this item."
        case String(describing: CodingKeys.brands):
            return "The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person."
        case CodingKeys.broker.rawValue:
            return "An entity that arranges for an exchange between a buyer and a seller."
        case CodingKeys.category.rawValue:
            return "A category for the item."
        case String(describing: CodingKeys.offerCatalog):
            return "Indicates an OfferCatalog listing for this Organization, Person, or Service."
        case CodingKeys.hoursAvailable.rawValue:
            return "The hours during which this service or contact is available."
        case String(describing: CodingKeys.relatedTo):
            return "A pointer to another, somehow related product (or multiple products)."
        case String(describing: CodingKeys.similarTo):
            return "A pointer to another, functionally similar product (or multiple products)."
        case CodingKeys.logo.rawValue:
            return "An associated logo."
        case CodingKeys.offers.rawValue:
            return "An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event."
        case CodingKeys.provider.rawValue:
            return "The service provider, service operator, or service performer; the goods producer."
        case CodingKeys.providerMobility.rawValue:
            return "Indicates the mobility of a provided service (e.g. 'static', 'dynamic')."
        case String(describing: CodingKeys.reviews):
            return "A review of the item."
        case CodingKeys.serviceOutput.rawValue:
            return "The tangible thing generated by the service, e.g. a passport, permit, etc."
        case CodingKeys.serviceType.rawValue:
            return "The type of service being offered, e.g. veterans' benefits, emergency relief, etc."
        case CodingKeys.termsOfService.rawValue:
            return "Human-readable terms of service documentation."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.aggregateRating.rawValue:
            self.aggregateRating = value as? AggregateRating
        case CodingKeys.areaServed.rawValue:
            self.areaServed = value as? AreaServed
        case CodingKeys.audience.rawValue:
            self.audience = value as? Audience
        case CodingKeys.availableChannel.rawValue:
            self.availableChannel = value as? ServiceChannel
        case String(describing: CodingKeys.awards):
            self.awards = value as? [String]
        case String(describing: CodingKeys.brands):
            self.brands = value as? [BrandOrOrganization]
        case CodingKeys.broker.rawValue:
            self.broker = value as? OrganizationOrPerson
        case CodingKeys.category.rawValue:
            self.category = value as? PhysicalActivityCategoryOrThingOrText
        case String(describing: CodingKeys.offerCatalog):
            self.offerCatalog = value as? OfferCatalog
        case CodingKeys.hoursAvailable.rawValue:
            self.hoursAvailable = value as? [OpeningHoursSpecification]
        case String(describing: CodingKeys.relatedTo):
            self.relatedTo = value as? [ProductOrService]
        case String(describing: CodingKeys.similarTo):
            self.similarTo = value as? [ProductOrService]
        case CodingKeys.logo.rawValue:
            self.logo = value as? ImageObjectOrURL
        case CodingKeys.offers.rawValue:
            self.offers = value as? [Offer]
        case CodingKeys.provider.rawValue:
            self.provider = value as? OrganizationOrPerson
        case CodingKeys.providerMobility.rawValue:
            self.providerMobility = value as? String
        case String(describing: CodingKeys.reviews):
            self.reviews = value as? [Review]
        case CodingKeys.serviceOutput.rawValue:
            self.serviceOutput = value as? Thing
        case CodingKeys.serviceType.rawValue:
            self.serviceType = value as? String
        case CodingKeys.termsOfService.rawValue:
            self.termsOfService = value as? String
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Service?, forKey key: K) throws {
        if let typedValue = value as? SOService {
            try self.encode(typedValue, forKey: key)
        }
    }
}
