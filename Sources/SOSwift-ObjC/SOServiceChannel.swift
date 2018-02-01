import Foundation
import SOSwiftVocabulary_ObjC

/// A means for accessing a service, e.g. a government office location, web site, or phone number.
public class SOServiceChannel: SOIntangible, ServiceChannel {
    
    public override class var type: String {
        return "ServiceChannel"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return []
    }
    
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
    
    private enum CodingKeys: String, CodingKey {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.availableLanguage = try container.decodeLanguageOrTextIfPresent(forKey: .availableLanguage)
        self.processingTime = try container.decodeDurationIfPresent(forKey: .processingTime)
        self.providesService = try container.decodeIfPresent(SOService.self, forKey: .providesService)
        self.serviceLocation = try container.decodeIfPresent(SOPlace.self, forKey: .serviceLocation)
        self.servicePhone = try container.decodeIfPresent(SOContactPoint.self, forKey: .servicePhone)
        self.servicePostalAddress = try container.decodeIfPresent(SOPostalAddress.self, forKey: .servicePostalAddress)
        self.serviceSmsNumber = try container.decodeIfPresent(SOContactPoint.self, forKey: .serviceSmsNumber)
        self.serviceUrl = try container.decodeIfPresent(URL.self, forKey: .serviceUrl)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.availableLanguage, forKey: .availableLanguage)
        try container.encodeIfPresent(self.processingTime, forKey: .processingTime)
        try container.encodeIfPresent(self.providesService, forKey: .providesService)
        try container.encodeIfPresent(self.serviceLocation, forKey: .serviceLocation)
        try container.encodeIfPresent(self.servicePhone, forKey: .servicePhone)
        try container.encodeIfPresent(self.servicePostalAddress, forKey: .servicePostalAddress)
        try container.encodeIfPresent(self.serviceSmsNumber, forKey: .serviceSmsNumber)
        try container.encodeIfPresent(self.serviceUrl, forKey: .serviceUrl)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: ServiceChannel?, forKey key: K) throws {
        if let typedValue = value as? SOServiceChannel {
            try self.encode(typedValue, forKey: key)
        }
    }
}
