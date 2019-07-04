import Foundation

/// A contact point—for example, a Customer Complaints department.
public class ContactPoint: StructuredValue {
    
    /// The geographic area where a service or offered item is provided.
    public var areaServed: AreaServed?
    
    /// A language someone may use with the item. Please use one of the
    /// language codes from the IETF BCP 47 standard.
    public var availableLanguage: LanguageOrText?
    
    /// An option available on this contact point (e.g. a toll-free number or
    /// support for hearing-impaired callers).
    public var contactOption: ContactPointOption?
    
    /// A person or organization can have different contact points, for different purposes.
    /// For example, a sales contact point, a PR contact point and so on. This property
    /// is used to specify the kind of contact point.
    public var contactType: String?
    
    /// Email address.
    public var email: String?
    
    /// The fax number.
    public var faxNumber: String?
    
    /// The hours during which this service or contact is available.
    public var hoursAvailable: [OpeningHoursSpecification]?
    
    /// The product or service this support contact point is related to (such as product
    /// support for a particular product line). This can be a specific product or product
    /// line (e.g. "iPhone") or a general category of products or services (e.g. "smartphones").
    public var productSupported: ProductOrText?
    
    /// The telephone number.
    public var telephone: String?
    
    internal enum ContactPointCodingKeys: String, CodingKey {
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: ContactPointCodingKeys.self)
        
        areaServed = try container.decodeIfPresent(AreaServed.self, forKey: .areaServed)
        availableLanguage = try container.decodeIfPresent(LanguageOrText.self, forKey: .availableLanguage)
        contactOption = try container.decodeIfPresent(ContactPointOption.self, forKey: .contactOption)
        contactType = try container.decodeIfPresent(String.self, forKey: .contactType)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        faxNumber = try container.decodeIfPresent(String.self, forKey: .faxNumber)
        hoursAvailable = try container.decodeIfPresent([OpeningHoursSpecification].self, forKey: .hoursAvailable)
        productSupported = try container.decodeIfPresent(ProductOrText.self, forKey: .productSupported)
        telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ContactPointCodingKeys.self)
        
        try container.encodeIfPresent(areaServed, forKey: .areaServed)
        try container.encodeIfPresent(availableLanguage, forKey: .availableLanguage)
        try container.encodeIfPresent(contactOption, forKey: .contactOption)
        try container.encodeIfPresent(contactType, forKey: .contactType)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(faxNumber, forKey: .faxNumber)
        try container.encodeIfPresent(hoursAvailable, forKey: .hoursAvailable)
        try container.encodeIfPresent(productSupported, forKey: .productSupported)
        try container.encodeIfPresent(telephone, forKey: .telephone)
        
        try super.encode(to: encoder)
    }
}
