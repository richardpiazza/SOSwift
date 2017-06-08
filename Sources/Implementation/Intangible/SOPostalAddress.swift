import Foundation

public class SOPostalAddress: SOContactPoint, PostalAddress {
    public struct Keys {
        public static let addressCountry = "addressCountry"
        public static let addressLocality = "addressLocality"
        public static let addressRegion = "addressRegion"
        public static let postOfficeBoxNumber = "postOfficeBoxNumber"
        public static let postalCode = "postalCode"
        public static let streetAddress = "streetAddress"
    }
    
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.addressCountry] as? String {
            self.addressCountry = value
        }
        if let value = dictionary[Keys.addressLocality] as? String {
            self.addressLocality = value
        }
        if let value = dictionary[Keys.addressRegion] as? String {
            self.addressRegion = value
        }
        if let value = dictionary[Keys.postOfficeBoxNumber] as? String {
            self.postOfficeBoxNumber = value
        }
        if let value = dictionary[Keys.postalCode] as? String {
            self.postalCode = value
        }
        if let value = dictionary[Keys.streetAddress] as? String {
            self.streetAddress = value
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.addressCountry as? String {
            dictionary[Keys.addressCountry] = value as AnyObject
        }
        if let value = self.addressLocality {
            dictionary[Keys.addressLocality] = value as AnyObject
        }
        if let value = self.addressRegion {
            dictionary[Keys.addressRegion] = value as AnyObject
        }
        if let value = self.postOfficeBoxNumber {
            dictionary[Keys.postOfficeBoxNumber] = value as AnyObject
        }
        if let value = self.postalCode {
            dictionary[Keys.postalCode] = value as AnyObject
        }
        if let value = self.streetAddress {
            dictionary[Keys.streetAddress] = value as AnyObject
        }
        return dictionary
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
