import Foundation
import SOSwiftVocabulary

public class SOContactPoint: SOStructuredValue, ContactPoint {
    override public class var type: String {
        return "ContactPoint"
    }
    
    /// The geographic area where a service or offered item is provided.
    public var areaServed: AreaServed?
    /// A language someone may use with the item. Please use one of the language codes from the IETF BCP 47 standard.
    public var availableLanguage: LanguageOrText?
    /// An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers).
    public var contactOption: ContactPointOption?
    /// A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.
    public var contactType: String?
    /// Email address.
    public var email: String?
    /// The fax number.
    public var faxNumber: String?
    /// The hours during which this service or contact is available.
    public var hoursAvailable: [OpeningHoursSpecification]?
    /// The product or service this support contact point is related to (such as product support for a particular product line). This can be a specific product or product line (e.g. "iPhone") or a general category of products or services (e.g. "smartphones").
    public var productSupported: ProductOrText?
    /// The telephone number.
    public var telephone: String?
    
    private enum CodingKeys: String, CodingKey {
        case areaServed
        case availableLanguage
        case contactOption
        case contactType
        case email
        case faxNumber
        case hoursAvailable
        case productSupported
        case telephone
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeAreaServedIfPresent(forKey: .areaServed) {
            self.areaServed = value
        }
        if let value = try container.decodeLanguageOrTextIfPresent(forKey: .availableLanguage) {
            self.availableLanguage = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .contactOption) {
            self.contactOption = ContactPointOption(rawValue: value)
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .contactType) {
            self.contactType = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .email) {
            self.email = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .faxNumber) {
            self.faxNumber = value
        }
        if let value = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .hoursAvailable) {
            self.hoursAvailable = value
        }
        if let value = try container.decodeProductOrTextIfPresent(forKey: .productSupported) {
            self.productSupported = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .telephone) {
            self.telephone = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.areaServed {
            try container.encodeAreaServed(value, forKey: .areaServed)
        }
        if let value = self.availableLanguage {
            try container.encodeLanguageOrText(value, forKey: .availableLanguage)
        }
        if let value = self.contactOption {
            try container.encode(value.rawValue, forKey: .contactOption)
        }
        if let value = self.contactType {
            try container.encode(value, forKey: .contactType)
        }
        if let value = self.email {
            try container.encode(value, forKey: .email)
        }
        if let value = self.faxNumber {
            try container.encode(value, forKey: .faxNumber)
        }
        if let value = self.hoursAvailable as? [SOOpeningHoursSpecification] {
            try container.encode(value, forKey: .hoursAvailable)
        }
        if let value = self.productSupported {
            try container.encodeProductOrText(value, forKey: .productSupported)
        }
        if let value = self.telephone {
            try container.encode(value, forKey: .telephone)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
