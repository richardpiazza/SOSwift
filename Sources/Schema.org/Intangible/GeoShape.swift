import Foundation

public protocol GeoShapeConformance:
                    GeoCoordinatesOrGeoShape,
                    AdministrativeAreaOrGeoShapeOrPlaceOrText {}

public protocol GeoShape: Thing, GeoShapeConformance {
    var address: PostalAddressOrText? { get set }
    var addressCountry: CountryOrText? { get set }
    var box: String? { get set }
    var circle: String? { get set }
    var elevation: NumberOrText? { get set }
    var line: String? { get set }
    var polygon: String? { get set }
    var postalCode: String? { get set }
}
