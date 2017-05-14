import Foundation

public class SOPostalAddress: SOContactPoint, PostalAddress {
    override public class var type: String {
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
