import Foundation

public protocol SchemaGeoCoordinatesDataTypeConformance:
                    SchemaGeoCoordinatesOrGeoShape {}

public protocol SchemaGeoCoordinates: SchemaStructuredValue, SchemaGeoCoordinatesDataTypeConformance {
    var address: SchemaPostalAddressOrText? { get set }
    var addressCountry: SchemaCountryOrText? { get set }
    var elevation: SchemaNumberOrText? { get set }
    var latitude: SchemaNumberOrText? { get set }
    var longitude: SchemaNumberOrText? { get set }
    var postalCode: String? { get set }
}
