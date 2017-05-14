import Foundation

public protocol ContactPointConformance:
                    ContactPointOrPlace
                {}

/// A contact point—for example, a Customer Complaints department.
public protocol ContactPoint: StructuredValue, ContactPointConformance {
    /// The geographic area where a service or offered item is provided.
    var areaServed: AdministrativeAreaOrGeoShapeOrPlaceOrText? { get set }
    /// A language someone may use with the item. Please use one of the language codes from the IETF BCP 47 standard.
    var availableLanguage: LanguageOrText? { get set }
    /// An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers).
    var contactOption: ContactPointOption? { get set }
    /// A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.
    var contactType: String? { get set }
    /// Email address.
    var email: String? { get set }
    /// The fax number.
    var faxNumber: String? { get set }
    /// The hours during which this service or contact is available.
    var hoursAvailable: [OpeningHoursSpecification]? { get set }
    /// The product or service this support contact point is related to (such as product support for a particular product line). This can be a specific product or product line (e.g. "iPhone") or a general category of products or services (e.g. "smartphones").
    var productSupported: ProductOrText? { get set }
    /// The telephone number.
    var telephone: String? { get set }
}
