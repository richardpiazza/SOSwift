import Foundation

/// A delivery service through which content is provided via broadcast over the air or online.
public class BroadcastService: Service {
    
    /// The media network(s) whose content is broadcast on this station.
    public var broadcastAffiliateOf: Organization?
    
    /// The name displayed in the channel guide.
    ///
    /// For many US affiliates, it is the network name.
    public var broadcastDisplayName: String?
    
    /// The timezone in ISO 8601 format for which the service bases its broadcasts
    public var broadcastTimezone: String?
    
    /// The organization owning or operating the broadcast service.
    public var broadcaster: Organization?
    
    /// A broadcast service to which the broadcast service may belong to such as regional variations of a national
    /// channel.
    public var parentService: BroadcastService?
    
    /// The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).
    public var videoFormat: String?
    
    internal enum BroadcastServiceCodingKeys: String, CodingKey {
        case broadcastAffliateOf
        case broadcastDisplayName
        case broadcastTimezone
        case broadcaster
        case parentService
        case videoFormat
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: BroadcastServiceCodingKeys.self)
        
        broadcastAffiliateOf = try container.decodeIfPresent(Organization.self, forKey: .broadcastAffliateOf)
        broadcastDisplayName = try container.decodeIfPresent(String.self, forKey: .broadcastDisplayName)
        broadcastTimezone = try container.decodeIfPresent(String.self, forKey: .broadcastTimezone)
        broadcaster = try container.decodeIfPresent(Organization.self, forKey: .broadcaster)
        parentService = try container.decodeIfPresent(BroadcastService.self, forKey: .parentService)
        videoFormat = try container.decodeIfPresent(String.self, forKey: .videoFormat)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BroadcastServiceCodingKeys.self)
        
        try container.encodeIfPresent(broadcastAffiliateOf, forKey: .broadcastAffliateOf)
        try container.encodeIfPresent(broadcastDisplayName, forKey: .broadcastDisplayName)
        try container.encodeIfPresent(broadcastTimezone, forKey: .broadcastTimezone)
        try container.encodeIfPresent(broadcaster, forKey: .broadcaster)
        try container.encodeIfPresent(parentService, forKey: .parentService)
        try container.encodeIfPresent(videoFormat, forKey: .videoFormat)
        
        try super.encode(to: encoder)
    }
}
