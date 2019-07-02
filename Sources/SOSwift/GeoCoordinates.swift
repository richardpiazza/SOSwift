import Foundation

/// The geographic coordinates of a place or event.
public class GeoCoordinates: StructuredValue {
    
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    
    /// The country. For example, USA. You can also provide the two-letter
    /// ISO 3166-1 alpha-2 country code.
    public var addressCountry: CountryOrText?
    
    /// The elevation of a location (WGS 84).
    public var elevation: NumberOrText?
    
    /// The latitude of a location. For example 37.42242 (WGS 84).
    public var latitude: NumberOrText?
    
    /// The longitude of a location. For example -122.08585 (WGS 84).
    public var longitude: NumberOrText?
    
    /// The postal code. For example, 94043
    public var postalCode: String?
    
    internal enum GeoCoordinatesCodingKeys: String, CodingKey {
        case address
        case addressCountry
        case elevation
        case latitude
        case logitude
        case postalCode
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: GeoCoordinatesCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: GeoCoordinatesCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
