import Foundation

/// The geographic coordinates of a place or event.
public class GeoCoordinates: StructuredValue {

    /// Physical address of the item.
    public var address: PostalAddressOrText?

    /// The country
    ///
    /// For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    public var addressCountry: CountryOrText?

    /// The elevation of a location (WGS 84).
    public var elevation: NumberOrText?

    /// The latitude of a location. For example 37.42242 (WGS 84).
    public var latitude: NumberOrText?

    /// The longitude of a location. For example -122.08585 (WGS 84).
    public var longitude: NumberOrText?

    /// The postal code. For example, 94043
    public var postalCode: String?

    enum GeoCoordinatesCodingKeys: String, CodingKey {
        case address
        case addressCountry
        case elevation
        case latitude
        case logitude
        case postalCode
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: GeoCoordinatesCodingKeys.self)

        address = try container.decodeIfPresent(PostalAddressOrText.self, forKey: .address)
        addressCountry = try container.decodeIfPresent(CountryOrText.self, forKey: .addressCountry)
        elevation = try container.decodeIfPresent(NumberOrText.self, forKey: .elevation)
        latitude = try container.decodeIfPresent(NumberOrText.self, forKey: .latitude)
        longitude = try container.decodeIfPresent(NumberOrText.self, forKey: .logitude)
        postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: GeoCoordinatesCodingKeys.self)

        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(addressCountry, forKey: .addressCountry)
        try container.encodeIfPresent(elevation, forKey: .elevation)
        try container.encodeIfPresent(latitude, forKey: .latitude)
        try container.encodeIfPresent(longitude, forKey: .logitude)
        try container.encodeIfPresent(postalCode, forKey: .postalCode)

        try super.encode(to: encoder)
    }
}
