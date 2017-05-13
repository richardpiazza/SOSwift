import Foundation

public protocol SchemaPlaceDataTypeConformance:
                    SchemaPlaceOrPostalAddressOrText,
                    SchemaContactPointOrPlace,
                    SchemaAdministrativeAreaOrGeoShapeOrPlaceOrText
                {}

public protocol SchemaPlace: SchemaThing, SchemaPlaceDataTypeConformance {
    var additionalProperty: SchemaPropertyValue? { get set }
    var address: SchemaPostalAddressOrText? { get set }
    var aggregateRating: SchemaAggregateRating? { get set }
    var amenityFeature: SchemaLocationFeatureSpecification? { get set }
    var branchCode: String? { get set }
    var containedInPlace: SchemaPlace? { get set }
    var containsPlace: SchemaPlace? { get set }
    var event: SchemaEvent? { get set }
    var faxNumber: String? { get set }
    var geo: SchemaGeoCoordinatesOrGeoShape? { get set }
    var globalLocationNumber: String? { get set }
    var hasMap: SchemaMapOrURL? { get set }
    var isicV4: String? { get set }
    var logo: SchemaImageObjectOrURL? { get set }
    var maximumAttendeeCapacity: Int? { get set }
    var openingHoursSpecification: [SchemaOpeningHoursSpecification]? { get set }
    var photo: SchemaImageObjectOrPhotograph? { get set }
    var review: SchemaReview? { get set }
    var smokingAllowed: Bool? { get set }
    var specialOpeningHoursSpecification: [SchemaOpeningHoursSpecification]? { get set }
    var telephone: String? { get set }
}
