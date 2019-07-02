import Foundation

public class GeoShape: Thing {
    
    /// Physical address of the item.
    public var address: PostalAddressOrText?
    
    /// The country. For example, USA. You can also provide the two-letter ISO
    /// 3166-1 alpha-2 country code.
    public var addressCountry: CountryOrText?
    
    /// A box is the area enclosed by the rectangle formed by two points. The
    /// first point is the lower corner, the second point is the upper corner. A
    /// box is expressed as two points separated by a space character.
    public var box: String?
    
    /// A circle is the circular region of a specified radius centered at a
    /// specified latitude and longitude. A circle is expressed as a pair
    /// followed by a radius in meters.
    public var circle: String?
    
    /// The elevation of a location (WGS 84).
    public var elevation: NumberOrText?
    
    /// A line is a point-to-point path consisting of two or more points. A line
    /// is expressed as a series of two or more point objects separated by
    /// space.
    public var line: String?
    
    /// A polygon is the area enclosed by a point-to-point path for which the
    /// starting and ending points are the same. A polygon is expressed as a
    /// series of four or more space delimited points where the first and final
    /// points are identical.
    public var polygon: String?
    
    /// The postal code. For example, 94043.
    public var postalCode: String?
    
    internal enum GeoShapeCodingKeys: String, CodingKey {
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
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: GeoShapeCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: GeoShapeCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
