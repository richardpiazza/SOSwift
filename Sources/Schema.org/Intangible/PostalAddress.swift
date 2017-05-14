import Foundation

public protocol PostalAddressConformance:
                    PostalAddressOrText,
                    PlaceOrPostalAddressOrText
                {}

/// The mailing address.
public protocol PostalAddress: ContactPoint, PostalAddressConformance {
    /// The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
    var addressCountry: CountryOrText? { get set }
    /// The locality. For example, Mountain View.
    var addressLocality: String? { get set }
    /// The region. For example, CA.
    var addressRegion: String? { get set }
    /// The post office box number for PO box addresses.
    var postOfficeBoxNumber: String? { get set }
    /// The postal code. For example, 94043.
    var postalCode: String? { get set }
    /// The street address. For example, 1600 Amphitheatre Pkwy.
    var streetAddress: String? { get set }
}
