import Foundation
import SOSwiftVocabulary

/// Entities that have a somewhat fixed, physical extension.
public class SOPlace: SOThing, Place {

    public override class var type: String {
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
    
    private enum CodingKeys: String, CodingKey {
        case additionalProperty
        case address
        case aggregateRating
        case amenityFeature
        case branchCode
        case containedInPlace
        case containsPlace
        case event
        case faxNumber
        case geo
        case globalLocationNumber
        case hasMap
        case isicV4
        case logo
        case maximumAttendeeCapacity
        case openingHoursSpecification
        case photo
        case review
        case smokingAllowed
        case specialOpeningHoursSpecification
        case telephone
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOPropertyValue.self, forKey: .additionalProperty) {
            self.additionalProperty = value
        }
        if let value = try container.decodePostalAddressOrTextIfPresent(forKey: .address) {
            self.address = value
        }
        if let value = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating) {
            self.aggregateRating = value
        }
        if let value = try container.decodeIfPresent(SOLocationFeatureSpecification.self, forKey: .amenityFeature) {
            self.amenityFeature = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .branchCode) {
            self.branchCode = value
        }
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .containedInPlace) {
            self.containedInPlace = value
        }
        if let value = try container.decodeIfPresent([SOPlace].self, forKey: .containsPlace) {
            self.containsPlace = value
        }
        if let value = try container.decodeIfPresent([SOEvent].self, forKey: .event) {
            self.event = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .faxNumber) {
            self.faxNumber = value
        }
        if let value = try container.decodeGeoCoordinatesOrGeoShapeIfPresent(forKey: .geo) {
            self.geo = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .globalLocationNumber) {
            self.globalLocationNumber = value
        }
        if let value = try container.decodeMapOrURLIfPresent(forKey: .hasMap) {
            self.hasMap = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .isicV4) {
            self.isicV4 = value
        }
        if let value = try container.decodeImageObjectOrURLIfPresent(forKey: .logo) {
            self.logo = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .maximumAttendeeCapacity) {
            self.maximumAttendeeCapacity = value
        }
        if let value = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .openingHoursSpecification) {
            self.openingHoursSpecification = value
        }
        if let value = try container.decodeImageObjectsOrPhotographsIfPresent(forKey: .photo) {
            self.photo = value
        }
        if let value = try container.decodeIfPresent([SOReview].self, forKey: .review) {
            self.review = value
        }
        if let value = try container.decodeIfPresent(Bool.self, forKey: .smokingAllowed) {
            self.smokingAllowed = value
        }
        if let value = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .specialOpeningHoursSpecification) {
            self.specialOpeningHoursSpecification = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .telephone) {
            self.telephone = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.additionalProperty as? SOPropertyValue {
            try container.encode(value, forKey: .additionalProperty)
        }
        try container.encodeIfPresent(self.address, forKey: .address)
        if let value = self.aggregateRating as? SOAggregateRating {
            try container.encode(value, forKey: .aggregateRating)
        }
        if let value = self.amenityFeature as? SOLocationFeatureSpecification {
            try container.encode(value, forKey: .amenityFeature)
        }
        if let value = self.branchCode {
            try container.encode(value, forKey: .branchCode)
        }
        if let value = self.containedInPlace as? SOPlace {
            try container.encode(value, forKey: .containedInPlace)
        }
        if let value = self.containsPlace as? [SOPlace] {
            try container.encode(value, forKey: .containsPlace)
        }
        if let value = self.event as? [SOEvent] {
            try container.encode(value, forKey: .event)
        }
        if let value = self.faxNumber {
            try container.encode(value, forKey: .faxNumber)
        }
        try container.encodeIfPresent(self.geo, forKey: .geo)
        if let value = self.globalLocationNumber {
            try container.encode(value, forKey: .globalLocationNumber)
        }
        try container.encodeIfPresent(self.hasMap, forKey: .hasMap)
        if let value = self.isicV4 {
            try container.encode(value, forKey: .isicV4)
        }
        try container.encodeIfPresent(self.logo, forKey: .logo)
        if let value = self.maximumAttendeeCapacity {
            try container.encode(value, forKey: .maximumAttendeeCapacity)
        }
        if let value = self.openingHoursSpecification as? [SOOpeningHoursSpecification] {
            try container.encode(value, forKey: .openingHoursSpecification)
        }
        try container.encodeIfPresent(self.photo, forKey: .photo)
        if let value = self.review as? [SOReview] {
            try container.encode(value, forKey: .review)
        }
        if let value = self.smokingAllowed {
            try container.encode(value, forKey: .smokingAllowed)
        }
        if let value = self.specialOpeningHoursSpecification as? [SOOpeningHoursSpecification] {
            try container.encode(value, forKey: .specialOpeningHoursSpecification)
        }
        if let value = self.telephone {
            try container.encode(value, forKey: .telephone)
        }
        
        try super.encode(to: encoder)
    }
}
