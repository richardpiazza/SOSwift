import Foundation
import SOSwiftVocabulary

public class SOBroadcastService: SOService, BroadcastService {
    
    override public class var type: String {
        return "BroadcastService"
    }
    
    /// The media network(s) whose content is broadcast on this station.
    public var broadcastAffiliateOf: Organization?
    /// The name displayed in the channel guide. For many US affiliates, it is the network name.
    public var broadcastDisplayName: String?
    /// The timezone in ISO 8601 format for which the service bases its broadcasts
    public var broadcastTimezone: String?
    /// The organization owning or operating the broadcast service.
    public var broadcaster: Organization?
    /// A broadcast service to which the broadcast service may belong to such as regional variations of a national channel.
    public var parentService: BroadcastService?
    /// The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).
    public var videoFormat: String?
    
    private enum CodingKeys: String, CodingKey {
        case broadcastAffiliateOf
        case broadcastDisplayName
        case broadcastTimezone
        case broadcaster
        case parentService
        case videoFormat
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey: .broadcastAffiliateOf) {
            self.broadcastAffiliateOf = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .broadcastDisplayName) {
            self.broadcastDisplayName = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .broadcastTimezone) {
            self.broadcastTimezone = value
        }
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey: .broadcaster) {
            self.broadcaster = value
        }
        if let value = try container.decodeIfPresent(SOBroadcastService.self, forKey: .parentService) {
            self.parentService = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .videoFormat) {
            self.videoFormat = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.broadcastAffiliateOf as? SOOrganization {
            try container.encode(value, forKey: .broadcastAffiliateOf)
        }
        if let value = self.broadcastDisplayName {
            try container.encode(value, forKey: .broadcastDisplayName)
        }
        if let value = self.broadcastTimezone {
            try container.encode(value, forKey: .broadcastTimezone)
        }
        if let value = self.broadcaster as? SOOrganization {
            try container.encode(value, forKey: .broadcaster)
        }
        if let value = self.parentService as? SOBroadcastService {
            try container.encode(value, forKey: .parentService)
        }
        if let value = self.videoFormat {
            try container.encode(value, forKey: .videoFormat)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
