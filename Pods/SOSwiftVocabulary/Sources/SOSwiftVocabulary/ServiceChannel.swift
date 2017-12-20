import Foundation

/// A means for accessing a service, e.g. a government office location, web site, or phone number.
public protocol ServiceChannel: Intangible {
    /// A language someone may use with the item. Please use one of the language codes from the IETF BCP 47 standard.
    var availableLanguage: LanguageOrText? { get set }
    /// Estimated processing time for the service using this channel.
    var processingTime: Duration? { get set }
    /// The service provided by this channel.
    var providesService: Service? { get set }
    /// The location (e.g. civic structure, local business, etc.) where a person can go to access the service.
    var serviceLocation: Place? { get set }
    /// The phone number to use to access the service.
    var servicePhone: ContactPoint? { get set }
    /// The address for accessing the service by mail.
    var servicePostalAddress: PostalAddress? { get set }
    /// The number to access the service by text message.
    var serviceSmsNumber: ContactPoint? { get set }
    /// The website to access the service.
    var serviceUrl: URL? { get set }
}
