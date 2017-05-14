import Foundation

public protocol PlaceConformance:
                    PlaceOrPostalAddressOrText,
                    ContactPointOrPlace,
                    AdministrativeAreaOrGeoShapeOrPlaceOrText
                {}

public protocol Place: Thing, PlaceConformance {
    var additionalProperty: PropertyValue? { get set }
    var address: PostalAddressOrText? { get set }
    var aggregateRating: AggregateRating? { get set }
    var amenityFeature: LocationFeatureSpecification? { get set }
    var branchCode: String? { get set }
    var containedInPlace: Place? { get set }
    var containsPlace: Place? { get set }
    var event: Event? { get set }
    var faxNumber: String? { get set }
    var geo: GeoCoordinatesOrGeoShape? { get set }
    var globalLocationNumber: String? { get set }
    var hasMap: MapOrURL? { get set }
    var isicV4: String? { get set }
    var logo: ImageObjectOrURL? { get set }
    var maximumAttendeeCapacity: Int? { get set }
    var openingHoursSpecification: [OpeningHoursSpecification]? { get set }
    var photo: ImageObjectOrPhotograph? { get set }
    var review: Review? { get set }
    var smokingAllowed: Bool? { get set }
    var specialOpeningHoursSpecification: [OpeningHoursSpecification]? { get set }
    var telephone: String? { get set }
}
