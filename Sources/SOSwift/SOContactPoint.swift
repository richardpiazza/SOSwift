import Foundation
import SOSwiftVocabulary

public class SOContactPoint: SOStructuredValue, ContactPoint {
    
    public override class var type: String {
        return "ContactPoint"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [SOPostalAddress.self]
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.areaServed = try container.decodeAreaServedIfPresent(forKey: .areaServed)
        self.availableLanguage = try container.decodeLanguageOrTextIfPresent(forKey: .availableLanguage)
        if let value = try container.decodeIfPresent(String.self, forKey: .contactOption) {
            self.contactOption = ContactPointOption(rawValue: value)
        }
        self.contactType = try container.decodeIfPresent(String.self, forKey: .contactType)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.faxNumber = try container.decodeIfPresent(String.self, forKey: .faxNumber)
        self.hoursAvailable = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .hoursAvailable)
        self.productSupported = try container.decodeProductOrTextIfPresent(forKey: .productSupported)
        self.telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.areaServed, forKey: .areaServed)
        try container.encodeIfPresent(self.availableLanguage, forKey: .availableLanguage)
        try container.encodeIfPresent(self.contactOption?.rawValue, forKey: .contactOption)
        try container.encodeIfPresent(self.contactType, forKey: .contactType)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.faxNumber, forKey: .faxNumber)
        try container.encodeIfPresent(self.hoursAvailable, forKey: .hoursAvailable)
        try container.encodeIfPresent(self.productSupported, forKey: .productSupported)
        try container.encodeIfPresent(self.telephone, forKey: .telephone)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.areaServed.rawValue:
            return "The geographic area where a service or offered item is provided."
        case CodingKeys.availableLanguage.rawValue:
            return "A language someone may use with the item."
        case CodingKeys.contactOption.rawValue:
            return "An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers)."
        case CodingKeys.contactType.rawValue:
            return "A person or organization can have different contact points, for different purposes."
        case CodingKeys.email.rawValue:
            return "The email address."
        case CodingKeys.faxNumber.rawValue:
            return "The fax number."
        case CodingKeys.hoursAvailable.rawValue:
            return "The hours during which this service or contact is available."
        case CodingKeys.productSupported.rawValue:
            return "The product or service this support contact point is related to (such as product support for a particular product line)."
        case CodingKeys.telephone.rawValue:
            return "The telephone number."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.areaServed.rawValue:
            self.areaServed = value as? AreaServed
        case CodingKeys.availableLanguage.rawValue:
            self.availableLanguage = value as? LanguageOrText
        case CodingKeys.contactOption.rawValue:
            self.contactOption = value as? ContactPointOption
        case CodingKeys.contactType.rawValue:
            self.contactType = value as? String
        case CodingKeys.email.rawValue:
            self.email = value as? String
        case CodingKeys.faxNumber.rawValue:
            self.faxNumber = value as? String
        case CodingKeys.hoursAvailable.rawValue:
            self.hoursAvailable = value as? [OpeningHoursSpecification]
        case CodingKeys.productSupported.rawValue:
            self.productSupported = value as? ProductOrText
        case CodingKeys.telephone.rawValue:
            self.telephone = value as? String
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: ContactPoint?, forKey key: K) throws {
        if let typedValue = value as? SOContactPoint {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [ContactPoint]?, forKey key: K) throws {
        if let typedValue = value as? [SOContactPoint] {
            try self.encode(typedValue, forKey: key)
        }
    }
}