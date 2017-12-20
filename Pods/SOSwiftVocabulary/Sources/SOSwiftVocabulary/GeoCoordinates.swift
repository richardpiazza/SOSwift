import Foundation

public protocol GeoCoordinatesConformance:
                    GeoCoordinatesOrGeoShape
                {}

/// The geographic coordinates of a place or event.
public protocol GeoCoordinates: StructuredValue, GeoCoordinatesConformance {
    /// Physical address of the item.
    var address: PostalAddressOrText? { get set }
    /// The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    var addressCountry: CountryOrText? { get set }
    /// The elevation of a location (WGS 84).
    var elevation: NumberOrText? { get set }
    /// The latitude of a location. For example 37.42242 (WGS 84).
    var latitude: NumberOrText? { get set }
    /// The longitude of a location. For example -122.08585 (WGS 84).
    var longitude: NumberOrText? { get set }
    /// The postal code. For example, 94043.
    var postalCode: String? { get set }
}
