import Foundation

/// Entities that have a somewhat fixed, physical extension.
public class SOPlace: SOThing, Place {
    public struct Keys {
        public static let additionalProperty = "additionalProperty"
        public static let address = "address"
        public static let aggregateRating = "aggregateRating"
        public static let amenityFeature = "amenityFeature"
        public static let branchCode = "branchCode"
        public static let containedInPlace = "containedInPlace"
        public static let containsPlace = "containsPlace"
        public static let event = "event"
        public static let faxNumber = "faxNumber"
        public static let geo = "geo"
        public static let globalLocationNumber = "globalLocationNumber"
        public static let hasMap = "hasMap"
        public static let isicV4 = "isicV4"
        public static let logo = "logo"
        public static let maximumAttendeeCapacity = "maximumAttendeeCapacity"
        public static let openingHoursSpecification = "openingHoursSpecification"
        public static let photo = "photo"
        public static let review = "review"
        public static let smokingAllowed = "smokingAllowed"
        public static let specialOpeningHoursSpecification = "specialOpeningHoursSpecification"
        public static let telephone = "telephon"
    }
    
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
        if let value = dictionary[Keys.additionalProperty] as? [String : AnyObject] {
            self.additionalProperty = SOPropertyValue(dictionary: value)
        }
        if let value = dictionary[Keys.address] {
            self.address = makePostalAddressOrText(anyObject: value)
        }
        if let value = dictionary[Keys.aggregateRating] as? [String : AnyObject] {
            self.aggregateRating = SOAggregateRating(dictionary: value)
        }
        if let value = dictionary[Keys.amenityFeature] as? [String : AnyObject] {
            self.amenityFeature = SOLocationFeatureSpecification(dictionary: value)
        }
        if let value = dictionary[Keys.branchCode] as? String {
            self.branchCode = value
        }
        if let value = dictionary[Keys.containedInPlace] as? [String : AnyObject] {
            self.containedInPlace = SOPlace(dictionary: value)
        }
        if let value = dictionary[Keys.containsPlace] {
            self.containsPlace = makePlaces(anyObject: value)
        }
        if let value = dictionary[Keys.event] {
            self.event = makeEvents(anyObject: value)
        }
        if let value = dictionary[Keys.faxNumber] as? String {
            self.faxNumber = value
        }
        if let value = dictionary[Keys.geo] as? [String : AnyObject] {
            self.geo = makeGeoCoordinatesOrGeoShape(dictionary: value)
        }
        if let value = dictionary[Keys.globalLocationNumber] as? String {
            self.globalLocationNumber = value
        }
        if let value = dictionary[Keys.hasMap] {
            self.hasMap = makeMapOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.isicV4] as? String {
            self.isicV4 = value
        }
        if let value = dictionary[Keys.logo] {
            self.logo = makeImageObjectOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.maximumAttendeeCapacity] as? Int {
            self.maximumAttendeeCapacity = value
        }
        if let value = dictionary[Keys.openingHoursSpecification] {
            self.openingHoursSpecification = makeOpeningHoursSpecifications(anyObject: value)
        }
        if let value = dictionary[Keys.photo] {
            self.photo = makeImageObjectOrPhotographs(anyObject: value)
        }
        if let value = dictionary[Keys.review] {
            self.review = makeReviews(anyObject: value)
        }
        if let value = dictionary[Keys.smokingAllowed] as? Bool {
            self.smokingAllowed = value
        }
        if let value = dictionary[Keys.specialOpeningHoursSpecification] {
            self.specialOpeningHoursSpecification = makeOpeningHoursSpecifications(anyObject: value)
        }
        if let value = dictionary[Keys.telephone] as? String {
            self.telephone = value
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.additionalProperty as? SOPropertyValue {
            dictionary[Keys.additionalProperty] = value.dictionary as AnyObject
        }
        if let value = self.address?.dictionaryValue {
            dictionary[Keys.address] = value
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            dictionary[Keys.aggregateRating] = value.dictionary as AnyObject
        }
        if let value = self.amenityFeature as? SOLocationFeatureSpecification {
            dictionary[Keys.amenityFeature] = value.dictionary as AnyObject
        }
        if let value = self.branchCode {
            dictionary[Keys.branchCode] = value as AnyObject
        }
        if let value = self.containedInPlace as? SOPlace {
            dictionary[Keys.containedInPlace] = value.dictionary as AnyObject
        }
        if let value = self.containsPlace as? [SOPlace] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.containsPlace] = values as AnyObject
        }
        if let value = self.event as? [SOEvent] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.event] = values as AnyObject
        }
        if let value = self.faxNumber {
            dictionary[Keys.faxNumber] = value as AnyObject
        }
        if let value = self.geo?.dictionaryValue {
            dictionary[Keys.geo] = value
        }
        if let value = self.globalLocationNumber {
            dictionary[Keys.globalLocationNumber] = value as AnyObject
        }
        if let value = self.hasMap?.dictionaryValue {
            dictionary[Keys.hasMap] = value
        }
        if let value = self.isicV4 {
            dictionary[Keys.isicV4] = value as AnyObject
        }
        if let value = self.logo?.dictionaryValue {
            dictionary[Keys.logo] = value
        }
        if let value = self.maximumAttendeeCapacity {
            dictionary[Keys.maximumAttendeeCapacity] = value as AnyObject
        }
        if let value = self.openingHoursSpecification as? [SOOpeningHoursSpecification] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.openingHoursSpecification] = values as AnyObject
        }
        if let value = self.photo {
            var values = [AnyObject]()
            for element in value {
                if let item = element.dictionaryValue {
                    values.append(item)
                }
            }
            dictionary[Keys.photo] = values as AnyObject
        }
        if let value = self.review as? [SOReview] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.review] = values as AnyObject
        }
        if let value = self.smokingAllowed {
            dictionary[Keys.smokingAllowed] = value as AnyObject
        }
        if let value = self.specialOpeningHoursSpecification as? [SOOpeningHoursSpecification] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.specialOpeningHoursSpecification] = values as AnyObject
        }
        if let value = self.telephone {
            dictionary[Keys.telephone] = value as AnyObject
        }
        return dictionary
    }
}
