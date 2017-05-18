import Foundation

/// Entities that have a somewhat fixed, physical extension.
public class SOPlace: SOThing, Place {
    override public class var type: String {
        return "Place"
    }
    
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    public var additionalProperty: PropertyValue?
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// An amenity feature (e.g. a characteristic or service) of the Accommodation. This generic property does not make a statement about whether the feature is included in an offer for the main accommodation or available at extra costs.
    public var amenityFeature: LocationFeatureSpecification?
    /// A short textual code (also called "store code") that uniquely identifies a place of business. The code is typically assigned by the parentOrganization and used in structured URLs.
    /// - For example, in the URL http://www.starbucks.co.uk/store-locator/etc/detail/3047 the code "3047" is a branchCode for a particular branch.
    public var branchCode: String?
    /// The basic containment relation between a place and one that contains it. Inverse property: containsPlace.
    public var containedInPlace: Place?
    /// The basic containment relation between a place and another that it contains. Inverse property: containedInPlace.
    public var containsPlace: [Place]?
    /// Upcoming or past event associated with this place, organization, or action.
    public var event: [Event]?
    /// The fax number.
    public var faxNumber: String?
    /// The geo coordinates of the place.
    public var geo: GeoCoordinatesOrGeoShape?
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    public var globalLocationNumber: String?
    /// A URL to a map of the place.
    public var hasMap: MapOrURL?
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
    public var isicV4: String?
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    /// The total number of individuals that may attend an event or venue.
    public var maximumAttendeeCapacity: Int?
    /// The opening hours of a certain place.
    public var openingHoursSpecification: [OpeningHoursSpecification]?
    /// A photograph of this place.
    public var photo: [ImageObjectOrPhotograph]?
    /// A review of the item.
    public var review: [Review]?
    /// Indicates whether it is allowed to smoke in the place, e.g. in the restaurant, hotel or hotel room.
    public var smokingAllowed: Bool?
    /// The special opening hours of a certain place.
    /// Use this to explicitly override general opening hours brought in scope by openingHoursSpecification or openingHours.
    public var specialOpeningHoursSpecification: [OpeningHoursSpecification]?
    /// The telephone number.
    public var telephone: String?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        
        return dictionary
    }
}
