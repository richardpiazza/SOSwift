import Foundation

/// The geographic coordinates of a place or event.
public class GeoCoordinates: StructuredValue, SchemaGeoCoordinates {
    public override var type: String {
        return "GeoCoordinates"
    }
    
    /// Physical address of the item.
    public var address: SchemaPostalAddressOrText?
    /// The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    public var addressCountry: SchemaCountryOrText?
    /// The elevation of a location (WGS 84).
    public var elevation: SchemaNumberOrText?
    /// The latitude of a location. For example 37.42242 (WGS 84).
    public var latitude: SchemaNumberOrText?
    /// The longitude of a location. For example -122.08585 (WGS 84).
    public var longitude: SchemaNumberOrText?
    /// The postal code. For example, 94043
    public var postalCode: String?
}
