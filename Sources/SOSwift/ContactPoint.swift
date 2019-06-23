import Foundation

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
    
}
