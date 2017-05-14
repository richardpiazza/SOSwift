import Foundation

public protocol GeoCoordinatesConformance:
                    GeoCoordinatesOrGeoShape {}

public protocol GeoCoordinates: StructuredValue, GeoCoordinatesConformance {
    var address: PostalAddressOrText? { get set }
    var addressCountry: CountryOrText? { get set }
    var elevation: NumberOrText? { get set }
    var latitude: NumberOrText? { get set }
    var longitude: NumberOrText? { get set }
    var postalCode: String? { get set }
}
