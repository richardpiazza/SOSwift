import Foundation

public protocol SchemaGeoCoordinatesDataTypeConformance:
                    GeoCoordinatesOrGeoShape {}

public protocol SchemaGeoCoordinates: StructuredValue, SchemaGeoCoordinatesDataTypeConformance {
    var address: PostalAddressOrText? { get set }
    var addressCountry: CountryOrText? { get set }
    var elevation: NumberOrText? { get set }
    var latitude: NumberOrText? { get set }
    var longitude: NumberOrText? { get set }
    var postalCode: String? { get set }
}
