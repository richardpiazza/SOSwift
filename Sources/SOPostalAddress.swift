import Foundation
import SOSwiftVocabulary

public class SOPostalAddress: SOContactPoint, PostalAddress {

    public override class var type: String {
        return "PostalAddress"
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeCountryOrTextIfPresent(forKey: .addressCountry) {
            self.addressCountry = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .addressLocality) {
            self.addressLocality = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .addressRegion) {
            self.addressRegion = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .postOfficeBoxNumber) {
            self.postOfficeBoxNumber = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .postalCode) {
            self.postalCode = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .streetAddress) {
            self.streetAddress = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.addressCountry {
            try container.encodeCountryOrText(value, forKey: .addressCountry)
        }
        if let value = self.addressLocality {
            try container.encode(value, forKey: .addressLocality)
        }
        if let value = self.addressRegion {
            try container.encode(value, forKey: .addressRegion)
        }
        if let value = self.postOfficeBoxNumber {
            try container.encode(value, forKey: .postOfficeBoxNumber)
        }
        if let value = self.postalCode {
            try container.encode(value, forKey: .postalCode)
        }
        if let value = self.streetAddress {
            try container.encode(value, forKey: .streetAddress)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
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
