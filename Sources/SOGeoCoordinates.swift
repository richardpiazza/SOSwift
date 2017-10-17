import Foundation
import SOSwiftVocabulary

/// The geographic coordinates of a place or event.
public class SOGeoCoordinates: SOStructuredValue, GeoCoordinates {
    
    public override class var type: String {
        return "GeoCoordinates"
    }
    
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    /// The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    public var addressCountry: CountryOrText?
    /// The elevation of a location (WGS 84).
    public var elevation: NumberOrText?
    /// The latitude of a location. For example 37.42242 (WGS 84).
    public var latitude: NumberOrText?
    /// The longitude of a location. For example -122.08585 (WGS 84).
    public var longitude: NumberOrText?
    /// The postal code. For example, 94043
    public var postalCode: String?
    
    private enum CodingKeys: String, CodingKey {
        case address
        case addressCountry
        case elevation
        case latitude
        case longitude
        case postalCode
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodePostalAddressOrTextIfPresent(forKey: .address) {
            self.address = value
        }
        if let value = try container.decodeCountryOrTextIfPresent(forKey: .addressCountry) {
            self.addressCountry = value
        }
        if let value = try container.decodeNumberOrTextIfPresent(forKey: .elevation) {
            self.elevation = value
        }
        if let value = try container.decodeNumberOrTextIfPresent(forKey: .latitude) {
            self.latitude = value
        }
        if let value = try container.decodeNumberOrTextIfPresent(forKey: .longitude) {
            self.longitude = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .postalCode) {
            self.postalCode = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.address {
            try container.encodePostalAddressOrText(value, forKey: .address)
        }
        if let value = self.addressCountry {
            try container.encodeCountryOrText(value, forKey: .addressCountry)
        }
        if let value = self.elevation {
            try container.encodeNumberOrText(value, forKey: .elevation)
        }
        if let value = self.latitude {
            try container.encodeNumberOrText(value, forKey: .latitude)
        }
        if let value = self.longitude {
            try container.encodeNumberOrText(value, forKey: .longitude)
        }
        if let value = self.postalCode {
            try container.encode(value, forKey: .postalCode)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
