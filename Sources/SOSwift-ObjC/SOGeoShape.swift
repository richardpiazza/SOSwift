import Foundation
import SOSwiftVocabulary_ObjC

/// The geographic shape of a place. A GeoShape can be described using several properties whose values are based on latitude/longitude pairs. Either whitespace or commas can be used to separate latitude and longitude; whitespace should be used when writing a list of several such points.
public class SOGeoShape: SOThing, GeoShape {
    
    public override class var type: String {
        return "GeoShape"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return []
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.address = try container.decodePostalAddressOrTextIfPresent(forKey: .address)
        self.addressCountry = try container.decodeCountryOrTextIfPresent(forKey: .addressCountry)
        self.box = try container.decodeIfPresent(String.self, forKey: .box)
        self.circle = try container.decodeIfPresent(String.self, forKey: .circle)
        self.elevation = try container.decodeNumberOrTextIfPresent(forKey: .elevation)
        self.line = try container.decodeIfPresent(String.self, forKey: .line)
        self.polygon = try container.decodeIfPresent(String.self, forKey: .polygon)
        self.postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.addressCountry, forKey: .addressCountry)
        try container.encodeIfPresent(self.box, forKey: .box)
        try container.encodeIfPresent(self.circle, forKey: .circle)
        try container.encodeIfPresent(self.elevation, forKey: .elevation)
        try container.encodeIfPresent(self.line, forKey: .line)
        try container.encodeIfPresent(self.polygon, forKey: .polygon)
        try container.encodeIfPresent(self.postalCode, forKey: .postalCode)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: GeoShape?, forKey key: K) throws {
        if let typedValue = value as? SOGeoShape {
            try self.encode(typedValue, forKey: key)
        }
    }
}
