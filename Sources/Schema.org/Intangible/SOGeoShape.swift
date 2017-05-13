import Foundation

public protocol SchemaGeoShapeDataTypeConformance:
                    SchemaGeoCoordinatesOrGeoShape,
                    SchemaAdministrativeAreaOrGeoShapeOrPlaceOrText {}

public protocol SchemaGeoShape: SchemaThing, SchemaGeoShapeDataTypeConformance {
    var address: SchemaPostalAddressOrText? { get set }
    var addressCountry: SchemaCountryOrText? { get set }
    var box: String? { get set }
    var circle: String? { get set }
    var elevation: SchemaNumberOrText? { get set }
    var line: String? { get set }
    var polygon: String? { get set }
    var postalCode: String? { get set }
}
