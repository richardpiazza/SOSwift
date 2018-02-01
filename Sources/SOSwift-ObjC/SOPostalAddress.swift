import Foundation
import SOSwiftVocabulary_ObjC

public class SOPostalAddress: SOContactPoint, PostalAddress {

    public override class var type: String {
        return "PostalAddress"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return []
    }
    
    /// The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    public var addressCountry: CountryOrText?
    /// The locality. For example, Mountain View.
    public var addressLocality: String?
    /// The region. For example, CA.
    public var addressRegion: String?
    /// The post office box number for PO box addresses.
    public var postOfficeBoxNumber: String?
    /// The postal code. For example, 94043.
    public var postalCode: String?
    /// The street address. For example, 1600 Amphitheatre Pkwy.
    public var streetAddress: String?
    
    private enum CodingKeys: String, CodingKey {
        case addressCountry
        case addressLocality
        case addressRegion
        case postOfficeBoxNumber
        case postalCode
        case streetAddress
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.addressCountry = try container.decodeCountryOrTextIfPresent(forKey: .addressCountry)
        self.addressLocality = try container.decodeIfPresent(String.self, forKey: .addressLocality)
        self.addressRegion = try container.decodeIfPresent(String.self, forKey: .addressRegion)
        self.postOfficeBoxNumber = try container.decodeIfPresent(String.self, forKey: .postOfficeBoxNumber)
        self.postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        self.streetAddress = try container.decodeIfPresent(String.self, forKey: .streetAddress)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.addressCountry, forKey: .addressCountry)
        try container.encodeIfPresent(self.addressLocality, forKey: .addressLocality)
        try container.encodeIfPresent(self.addressRegion, forKey: .addressRegion)
        try container.encodeIfPresent(self.postOfficeBoxNumber, forKey: .postOfficeBoxNumber)
        try container.encodeIfPresent(self.postalCode, forKey: .postalCode)
        try container.encodeIfPresent(self.streetAddress, forKey: .streetAddress)
        
        try super.encode(to: encoder)
    }
    
    public var street: String? {
        return streetAddress
    }
    
    public var city: String? {
        return addressLocality
    }
    
    public var state: String? {
        return addressRegion
    }
    
    public var zip: String? {
        return postalCode
    }
    
    public var poBox: String? {
        return postOfficeBoxNumber
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: PostalAddress?, forKey key: K) throws {
        if let typedValue = value as? SOPostalAddress {
            try self.encode(typedValue, forKey: key)
        }
    }
}
