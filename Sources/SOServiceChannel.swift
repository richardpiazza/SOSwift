import Foundation
import SOSwiftVocabulary

/// A means for accessing a service, e.g. a government office location, web site, or phone number.
public class SOServiceChannel: SOIntangible, ServiceChannel {
    
    public override class var type: String {
        return "ServiceChannel"
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeLanguageOrTextIfPresent(forKey: .availableLanguage) {
            self.availableLanguage = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .processingTime) {
            self.processingTime = value
        }
        if let value = try container.decodeIfPresent(SOService.self, forKey: .providesService) {
            self.providesService = value
        }
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .serviceLocation) {
            self.serviceLocation = value
        }
        if let value = try container.decodeIfPresent(SOContactPoint.self, forKey: .servicePhone) {
            self.servicePhone = value
        }
        if let value = try container.decodeIfPresent(SOPostalAddress.self, forKey: .servicePostalAddress) {
            self.servicePostalAddress = value
        }
        if let value = try container.decodeIfPresent(SOContactPoint.self, forKey: .serviceSmsNumber) {
            self.serviceSmsNumber = value
        }
        if let value = try container.decodeIfPresent(URL.self, forKey: .serviceUrl) {
            self.serviceUrl = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.availableLanguage {
            try container.encodeLanguageOrText(value, forKey: .availableLanguage)
        }
        if let value = self.processingTime as? String {
            try container.encode(value, forKey: .processingTime)
        }
        if let value = self.providesService as? SOService {
            try container.encode(value, forKey: .providesService)
        }
        if let value = self.serviceLocation as? SOPlace {
            try container.encode(value, forKey: .serviceLocation)
        }
        if let value = self.servicePhone as? SOContactPoint {
            try container.encode(value, forKey: .servicePhone)
        }
        if let value = self.servicePostalAddress as? SOPostalAddress {
            try container.encode(value, forKey: .servicePostalAddress)
        }
        if let value = self.serviceSmsNumber as? SOContactPoint {
            try container.encode(value, forKey: .serviceSmsNumber)
        }
        if let value = self.serviceUrl {
            try container.encode(value, forKey: .serviceUrl)
        }
        
        try super.encode(to: encoder)
    }
}
