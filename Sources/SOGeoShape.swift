import Foundation
import SOSwiftVocabulary

/// The geographic shape of a place. A GeoShape can be described using several properties whose values are based on latitude/longitude pairs. Either whitespace or commas can be used to separate latitude and longitude; whitespace should be used when writing a list of several such points.
public class SOGeoShape: SOThing, GeoShape {
    
    override public class var type: String {
        return "GeoShape"
    }
    
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    /// The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    public var addressCountry: CountryOrText?
    /// A box is the area enclosed by the rectangle formed by two points. The first point is the lower corner, the second point is the upper corner. A box is expressed as two points separated by a space character.
    public var box: String?
    /// A circle is the circular region of a specified radius centered at a specified latitude and longitude. A circle is expressed as a pair followed by a radius in meters.
    public var circle: String?
    /// The elevation of a location (WGS 84).
    public var elevation: NumberOrText?
    /// A line is a point-to-point path consisting of two or more points. A line is expressed as a series of two or more point objects separated by space.
    public var line: String?
    /// A polygon is the area enclosed by a point-to-point path for which the starting and ending points are the same. A polygon is expressed as a series of four or more space delimited points where the first and final points are identical.
    public var polygon: String?
    /// The postal code. For example, 94043.
    public var postalCode: String?
    
    private enum CodingKeys: String, CodingKey {
        case address
        case addressCountry
        case box
        case circle
        case elevation
        case line
        case polygon
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
        if let value = try container.decodeIfPresent(String.self, forKey: .box) {
            self.box = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .circle) {
            self.circle = value
        }
        if let value = try container.decodeNumberOrTextIfPresent(forKey: .elevation) {
            self.elevation = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .line) {
            self.line = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .polygon) {
            self.polygon = value
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
        if let value = self.box {
            try container.encode(value, forKey: .box)
        }
        if let value = self.circle {
            try container.encode(value, forKey: .circle)
        }
        if let value = self.elevation {
            try container.encodeNumberOrText(value, forKey: .elevation)
        }
        if let value = self.line {
            try container.encode(value, forKey: .line)
        }
        if let value = self.polygon {
            try container.encode(value, forKey: .polygon)
        }
        if let value = self.postalCode {
            try container.encode(value, forKey: .postalCode)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
