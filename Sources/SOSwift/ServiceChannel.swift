import Foundation

/// A means for accessing a service, e.g. a government office location, web site,
/// or phone number.
public class ServiceChannel: Intangible {
    
    /// A language someone may use with the item. Please use one of the language codes from the IETF BCP 47 standard.
    public var availableLanguage: LanguageOrText?
    
    /// Estimated processing time for the service using this channel.
    public var processingTime: Duration?
    
    /// The service provided by this channel.
    public var providesService: Service?
    
    /// The location (e.g. civic structure, local business, etc.) where a person can go to access the service.
    public var serviceLocation: Place?
    
    /// The phone number to use to access the service.
    public var servicePhone: ContactPoint?
    
    /// The address for accessing the service by mail.
    public var servicePostalAddress: PostalAddress?
    
    /// The number to access the service by text message.
    public var serviceSmsNumber: ContactPoint?
    
    /// The website to access the service.
    public var serviceUrl: URL?
    
    internal enum ServiceChannelCodingKeys: String, CodingKey {
        case availableLanguage
        case processingTime
        case providesService
        case serviceLocation
        case servicePhone
        case servicePostalAddress
        case serviceSmsNumber
        case serviceUrl
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: ServiceChannelCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ServiceChannelCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
