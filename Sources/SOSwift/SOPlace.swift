import Foundation
import SOSwiftVocabulary

/// Entities that have a somewhat fixed, physical extension.
public class SOPlace: SOThing, Place {

    public override class var type: String {
        return "Place"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOAdministrativeArea.self
        ]
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
    public var containsPlaces: [Place]?
    /// Upcoming or past event associated with this place, organization, or action.
    public var events: [Event]?
    /// The fax number.
    public var faxNumber: String?
    /// The geo coordinates of the place.
    public var geo: GeoCoordinatesOrGeoShape?
    /// The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
    public var globalLocationNumber: String?
    /// A URL to a map of the place.
    public var map: MapOrURL?
    /// The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.additionalProperty = try container.decodeIfPresent(SOPropertyValue.self, forKey: .additionalProperty)
        self.address = try container.decodePostalAddressOrTextIfPresent(forKey: .address)
        self.aggregateRating = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating)
        self.amenityFeature = try container.decodeIfPresent(SOLocationFeatureSpecification.self, forKey: .amenityFeature)
        self.branchCode = try container.decodeIfPresent(String.self, forKey: .branchCode)
        self.containedInPlace = try container.decodeIfPresent(SOPlace.self, forKey: .containedInPlace)
        self.containsPlaces = try container.decodeArrayOrElementIfPresent(SOPlace.self, forKey: .containsPlaces)
        self.events = try container.decodeArrayOrElementIfPresent(SOEvent.self, forKey: .events)
        self.faxNumber = try container.decodeIfPresent(String.self, forKey: .faxNumber)
        self.geo = try container.decodeGeoCoordinatesOrGeoShapeIfPresent(forKey: .geo)
        self.globalLocationNumber = try container.decodeIfPresent(String.self, forKey: .globalLocationNumber)
        self.map = try container.decodeMapOrURLIfPresent(forKey: .map)
        self.isicV4 = try container.decodeIfPresent(String.self, forKey: .isicV4)
        self.logo = try container.decodeImageObjectOrURLIfPresent(forKey: .logo)
        self.maximumAttendeeCapacity = try container.decodeIfPresent(Int.self, forKey: .maximumAttendeeCapacity)
        self.openingHoursSpecification = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .openingHoursSpecification)
        self.photos = try container.decodeImageObjectsOrPhotographsIfPresent(forKey: .photos)
        self.reviews = try container.decodeArrayOrElementIfPresent(SOReview.self, forKey: .reviews)
        self.smokingAllowed = try container.decodeIfPresent(Bool.self, forKey: .smokingAllowed)
        self.specialOpeningHoursSpecification = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .specialOpeningHoursSpecification)
        self.telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.additionalProperty, forKey: .additionalProperty)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(self.amenityFeature, forKey: .amenityFeature)
        try container.encodeIfPresent(self.branchCode, forKey: .branchCode)
        try container.encodeIfPresent(self.containedInPlace, forKey: .containedInPlace)
        try container.encodeIfPresent(self.containsPlaces, forKey: .containsPlaces)
        try container.encodeIfPresent(self.events, forKey: .events)
        try container.encodeIfPresent(self.faxNumber, forKey: .faxNumber)
        try container.encodeIfPresent(self.geo, forKey: .geo)
        try container.encodeIfPresent(self.globalLocationNumber, forKey: .globalLocationNumber)
        try container.encodeIfPresent(self.map, forKey: .map)
        try container.encodeIfPresent(self.isicV4, forKey: .isicV4)
        try container.encodeIfPresent(self.logo, forKey: .logo)
        try container.encodeIfPresent(self.maximumAttendeeCapacity, forKey: .maximumAttendeeCapacity)
        try container.encodeIfPresent(self.openingHoursSpecification, forKey: .openingHoursSpecification)
        try container.encodeIfPresent(self.photos, forKey: .photos)
        try container.encodeIfPresent(self.reviews, forKey: .reviews)
        try container.encodeIfPresent(self.smokingAllowed, forKey: .smokingAllowed)
        try container.encodeIfPresent(self.specialOpeningHoursSpecification, forKey: .specialOpeningHoursSpecification)
        try container.encodeIfPresent(self.telephone, forKey: .telephone)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.additionalProperty.rawValue:
            return "A property-value pair representing an additional characteristics of the entitity."
        case CodingKeys.address.rawValue:
            return "Physical address of the item."
        case CodingKeys.aggregateRating.rawValue:
            return "The overall rating, based on a collection of reviews or ratings, of the item."
        case CodingKeys.amenityFeature.rawValue:
            return "An amenity feature (e.g. a characteristic or service) of the Accommodation."
        case CodingKeys.branchCode.rawValue:
            return "A short textual code that uniquely identifies a place of business."
        case CodingKeys.containedInPlace.rawValue:
            return "The basic containment relation between a place and one that contains it."
        case "containsPlaces":
            return "The basic containment relation between a place and another that it contains."
        case "events":
            return "Upcoming or past event associated with this place, organization, or action."
        case CodingKeys.faxNumber.rawValue:
            return "The fax number."
        case CodingKeys.geo.rawValue:
            return "The geo coordinates of the place."
        case CodingKeys.globalLocationNumber.rawValue:
            return "The Global Location Number."
        case "map":
            return "A URL to a map of the place."
        case CodingKeys.isicV4.rawValue:
            return "The International Standard of Industrial Classification of All Economic Activities."
        case CodingKeys.logo.rawValue:
            return "An associated logo."
        case CodingKeys.maximumAttendeeCapacity.rawValue:
            return "The total number of individuals that may attend an event or venue."
        case CodingKeys.openingHoursSpecification.rawValue:
            return "The opening hours of a certain place."
        case "photos":
            return "A photograph of this place."
        case "reviews":
            return "A review of the item."
        case CodingKeys.smokingAllowed.rawValue:
            return "Indicates whether it is allowed to smoke in the place."
        case CodingKeys.specialOpeningHoursSpecification.rawValue:
            return "The special opening hours of a certain place."
        case CodingKeys.telephone.rawValue:
            return "The telephone number."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.additionalProperty.rawValue:
            self.additionalProperty = value as? PropertyValue
        case CodingKeys.address.rawValue:
            self.address = value as? PostalAddressOrText
        case CodingKeys.aggregateRating.rawValue:
            self.aggregateRating = value as? AggregateRating
        case CodingKeys.amenityFeature.rawValue:
            self.amenityFeature = value as? LocationFeatureSpecification
        case CodingKeys.branchCode.rawValue:
            self.branchCode = value as? String
        case CodingKeys.containedInPlace.rawValue:
            self.containedInPlace = value as? Place
        case "containsPlaces":
            self.containsPlaces = value as? [Place]
        case "events":
            self.events = value as? [Event]
        case CodingKeys.faxNumber.rawValue:
            self.faxNumber = value as? String
        case CodingKeys.geo.rawValue:
            self.geo = value as? GeoCoordinatesOrGeoShape
        case CodingKeys.globalLocationNumber.rawValue:
            self.globalLocationNumber = value as? String
        case "map":
            self.map = value as? MapOrURL
        case CodingKeys.isicV4.rawValue:
            self.isicV4 = value as? String
        case CodingKeys.logo.rawValue:
            self.logo = value as? ImageObjectOrURL
        case CodingKeys.maximumAttendeeCapacity.rawValue:
            self.maximumAttendeeCapacity = value as? Int
        case CodingKeys.openingHoursSpecification.rawValue:
            self.openingHoursSpecification = value as? [OpeningHoursSpecification]
        case "photos":
            self.photos = value as? [ImageObjectOrPhotograph]
        case "reviews":
            self.reviews = value as? [Review]
        case CodingKeys.smokingAllowed.rawValue:
            self.smokingAllowed = value as? Bool
        case CodingKeys.specialOpeningHoursSpecification.rawValue:
            self.specialOpeningHoursSpecification = value as? [OpeningHoursSpecification]
        case CodingKeys.telephone.rawValue:
            self.telephone = value as? String
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Place?, forKey key: K) throws {
        if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [Place]?, forKey key: K) throws {
        if let typedValue = value as? [SOPlace] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
