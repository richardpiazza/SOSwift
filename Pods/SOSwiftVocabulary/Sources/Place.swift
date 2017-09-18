import Foundation

public protocol PlaceConformance:
                    PlaceOrPostalAddressOrText,
                    ContactPointOrPlace,
                    AreaServed
                {}

/// Entities that have a somewhat fixed, physical extension.
public protocol Place: Thing, PlaceConformance {
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    var additionalProperty: PropertyValue? { get set }
    /// Physical address of the item.
    var address: PostalAddressOrText? { get set }
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    var aggregateRating: AggregateRating? { get set }
    /// An amenity feature (e.g. a characteristic or service) of the Accommodation. This generic property does not make a statement about whether the feature is included in an offer for the main accommodation or available at extra costs.
    var amenityFeature: LocationFeatureSpecification? { get set }
    /// A short textual code (also called "store code") that uniquely identifies a place of business. The code is typically assigned by the parentOrganization and used in structured URLs.
    /// For example, in the URL http://www.starbucks.co.uk/store-locator/etc/detail/3047 the code "3047" is a branchCode for a particular branch.
    var branchCode: String? { get set }
    /// The basic containment relation between a place and one that contains it.
    /// Inverse property: containsPlace
    var containedInPlace: Place? { get set }
    /// The basic containment relation between a place and another that it contains.
    /// Inverse property: containedInPlace.
    var containsPlace: [Place]? { get set }
    /// Upcoming or past event associated with this place, organization, or action.
    var event: [Event]? { get set }
    /// The fax number.
    var faxNumber: String? { get set }
    /// The geo coordinates of the place.
    var geo: GeoCoordinatesOrGeoShape? { get set }
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    var globalLocationNumber: String? { get set }
    /// A URL to a map of the place.
    var hasMap: MapOrURL? { get set }
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
    var isicV4: String? { get set }
    /// An associated logo.
    var logo: ImageObjectOrURL? { get set }
    /// The total number of individuals that may attend an event or venue.
    var maximumAttendeeCapacity: Int? { get set }
    /// The opening hours of a certain place.
    var openingHoursSpecification: [OpeningHoursSpecification]? { get set }
    /// A photograph of this place.
    var photo: [ImageObjectOrPhotograph]? { get set }
    /// A review of the item.
    var review: [Review]? { get set }
    /// Indicates whether it is allowed to smoke in the place, e.g. in the restaurant, hotel or hotel room.
    var smokingAllowed: Bool? { get set }
    /// The special opening hours of a certain place.
    /// Use this to explicitly override general opening hours brought in scope by openingHoursSpecification or openingHours.
    var specialOpeningHoursSpecification: [OpeningHoursSpecification]? { get set }
    /// The telephone number.
    var telephone: String? { get set }
}
