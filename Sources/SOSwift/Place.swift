import Foundation

public class Place: Thing {
    
    /// A property-value pair representing an additional characteristics of the
    /// entitity, e.g. a product feature or another characteristic for which
    /// there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use
    ///         specific schema.org properties (e.g. http://schema.org/width,
    ///         http://schema.org/color, http://schema.org/gtin13, ...) will
    ///         typically expect such data to be provided using those
    ///         properties, rather than using the generic property/value
    ///         mechanism.
    public var additionalProperty: PropertyValue?
    
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    
    /// The overall rating, based on a collection of reviews or ratings, of the
    /// item.
    public var aggregateRating: AggregateRating?
    
    /// An amenity feature (e.g. a characteristic or service) of the
    /// Accommodation. This generic property does not make a statement about
    /// whether the feature is included in an offer for the main accommodation
    /// or available at extra costs.
    public var amenityFeature: LocationFeatureSpecification?
    
    /// A short textual code (also called "store code") that uniquely identifies
    /// a place of business. The code is typically assigned by the
    /// parentOrganization and used in structured URLs.
    /// - example:, in the URL http://www.starbucks.co.uk/store-locator/etc/detail/3047
    ///             the code "3047" is a branchCode for a particular branch.
    public var branchCode: String?
    
    /// The basic containment relation between a place and one that contains it.
    /// - **Inverse property**: _containsPlace_
    public var containedInPlace: Place?
    
    /// The basic containment relation between a place and another that it
    /// contains.
    /// - **Inverse property**: _containedInPlace_
    public var containsPlaces: [Place]?
    
    /// Upcoming or past event associated with this place, organization, or
    /// action.
    public var events: [Event]?
    
    /// The fax number.
    public var faxNumber: String?
    
    /// The geo coordinates of the place.
    public var geo: GeoCoordinatesOrGeoShape?
    
    /// The Global Location Number (GLN, sometimes also referred to as
    /// International Location Number or ILN) of the respective organization,
    /// person, or place. The GLN is a 13-digit number used to identify parties
    /// and physical locations.
    public var globalLocationNumber: String?
    
    /// A URL to a map of the place.
    public var map: MapOrURL?
    
    /// The International Standard of Industrial Classification of All Economic
    /// Activities (ISIC), Revision 4 code for a particular organization,
    /// business person, or place.
    public var isicV4: String?
    
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    
    /// The total number of individuals that may attend an event or venue.
    public var maximumAttendeeCapacity: Int?
    
    /// The opening hours of a certain place.
    public var openingHoursSpecification: [OpeningHoursSpecification]?
    
    /// A photograph of this place.
    public var photos: [ImageObjectOrPhotograph]?
    
    /// A review of the item.
    public var reviews: [Review]?
    
    /// Indicates whether it is allowed to smoke in the place, e.g. in the
    /// restaurant, hotel or hotel room.
    public var smokingAllowed: Bool?
    
    /// The special opening hours of a certain place.
    /// Use this to explicitly override general opening hours brought in scope
    /// by openingHoursSpecification or openingHours.
    public var specialOpeningHoursSpecification: [OpeningHoursSpecification]?
    
    /// The telephone number.
    public var telephone: String?
    
    private enum PlaceCodingKeys: String, CodingKey {
        case additionalProperty
        case address
        case aggregateRating
        case amenityFeature
        case branchCode
        case containedInPlace
        case containsPlaces = "containsPlace"
        case events = "event"
        case faxNumber
        case geo
        case globalLocationNumber
        case map = "hasMap"
        case isicV4
        case logo
        case maximumAttendeeCapacity
        case openingHoursSpecification
        case photos = "photo"
        case reviews = "review"
        case smokingAllowed
        case specialOpeningHoursSpecification
        case telephone
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: PlaceCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PlaceCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
