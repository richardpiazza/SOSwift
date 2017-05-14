import Foundation

public protocol GeoShapeConformance:
                    GeoCoordinatesOrGeoShape,
                    AdministrativeAreaOrGeoShapeOrPlaceOrText {}

/// The geographic shape of a place.
/// A GeoShape can be described using several properties whose values are based on latitude/longitude pairs.
/// Either whitespace or commas can be used to separate latitude and longitude; whitespace should be used when writing a list of several such points.
public protocol GeoShape: Thing, GeoShapeConformance {
    /// Physical address of the item.
    var address: PostalAddressOrText? { get set }
    /// The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    var addressCountry: CountryOrText? { get set }
    /// A box is the area enclosed by the rectangle formed by two points. The first point is the lower corner, the second point is the upper corner. A box is expressed as two points separated by a space character.
    var box: String? { get set }
    /// A circle is the circular region of a specified radius centered at a specified latitude and longitude. A circle is expressed as a pair followed by a radius in meters.
    var circle: String? { get set }
    /// The elevation of a location (WGS 84).
    var elevation: NumberOrText? { get set }
    /// A line is a point-to-point path consisting of two or more points. A line is expressed as a series of two or more point objects separated by space.
    var line: String? { get set }
    /// A polygon is the area enclosed by a point-to-point path for which the starting and ending points are the same. A polygon is expressed as a series of four or more space delimited points where the first and final points are identical.
    var polygon: String? { get set }
    /// The postal code. For example, 94043.
    var postalCode: String? { get set }
}
