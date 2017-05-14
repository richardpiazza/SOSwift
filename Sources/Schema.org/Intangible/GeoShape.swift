import Foundation

public protocol SchemaGeoShapeDataTypeConformance:
                    GeoCoordinatesOrGeoShape,
                    AdministrativeAreaOrGeoShapeOrPlaceOrText {}

public protocol SchemaGeoShape: Thing, SchemaGeoShapeDataTypeConformance {
    var address: PostalAddressOrText? { get set }
    var addressCountry: CountryOrText? { get set }
    var box: String? { get set }
    var circle: String? { get set }
    var elevation: NumberOrText? { get set }
    var line: String? { get set }
    var polygon: String? { get set }
    var postalCode: String? { get set }
}
