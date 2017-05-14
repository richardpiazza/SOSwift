import Foundation

public protocol SchemaPlaceDataTypeConformance:
                    PlaceOrPostalAddressOrText,
                    ContactPointOrPlace,
                    AdministrativeAreaOrGeoShapeOrPlaceOrText
                {}

public protocol SchemaPlace: Thing, SchemaPlaceDataTypeConformance {
    var additionalProperty: PropertyValue? { get set }
    var address: PostalAddressOrText? { get set }
    var aggregateRating: SchemaAggregateRating? { get set }
    var amenityFeature: SchemaLocationFeatureSpecification? { get set }
    var branchCode: String? { get set }
    var containedInPlace: SchemaPlace? { get set }
    var containsPlace: SchemaPlace? { get set }
    var event: SchemaEvent? { get set }
    var faxNumber: String? { get set }
    var geo: GeoCoordinatesOrGeoShape? { get set }
    var globalLocationNumber: String? { get set }
    var hasMap: MapOrURL? { get set }
    var isicV4: String? { get set }
    var logo: ImageObjectOrURL? { get set }
    var maximumAttendeeCapacity: Int? { get set }
    var openingHoursSpecification: [SchemaOpeningHoursSpecification]? { get set }
    var photo: ImageObjectOrPhotograph? { get set }
    var review: SchemaReview? { get set }
    var smokingAllowed: Bool? { get set }
    var specialOpeningHoursSpecification: [SchemaOpeningHoursSpecification]? { get set }
    var telephone: String? { get set }
}
