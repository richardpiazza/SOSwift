import Foundation

/// A delivery service through which content is provided via broadcast over the air or online.
public class BroadcastService: Service {
    /// The media network(s) whose content is broadcast on this station.
    public var broadcastAffiliateOf: Organization?
    
    /// The name displayed in the channel guide.
    ///
    /// For many US affiliates, it is the network name.
    public var broadcastDisplayName: String?
    
    /// The frequency used for over-the-air broadcasts. Numeric values or simple ranges, e.g. 87-99.
    ///
    /// In addition a shortcut idiom is supported for frequencies of AM and FM radio channels, e.g. "87 FM".
    public var broadcastFrequency: SingleTextConjunction<BroadcastFrequencySpecification>?
    
    /// The timezone in ISO 8601 format for which the service bases its broadcasts
    public var broadcastTimezone: String?
    
    /// The organization owning or operating the broadcast service.
    public var broadcaster: Organization?
    
    /// A callsign, as used in broadcasting and radio communications to identify people, radio and TV stations, or vehicles.
    public var callSign: String?
    
    /// A broadcast channel of a broadcast service.
    ///
    /// Inverse property: `providesBroadcastService`
    public var hasBroadcastChannel: BroadcastChannel?
    
    /// The language of the content or performance or used in an action.
    public var inLanguage: SingleTextConjunction<Language>?
    
    /// A broadcast service to which the broadcast service may belong to such as regional variations of a national
    /// channel.
    public var parentService: BroadcastService?
    
    /// The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).
    public var videoFormat: String?
    
    internal enum BroadcastServiceCodingKeys: String, CodingKey {
        case broadcastAffiliateOf
        case broadcastDisplayName
        case broadcastFrequency
        case broadcastTimezone
        case broadcaster
        case callSign
        case hasBroadcastChannel
        case inLanguage
        case parentService
        case videoFormat
    }
    
    public override init() {
        super.init()
    }
    
    public convenience init(
        broadcastAffiliateOf: Organization? = nil,
        broadcastDisplayName: String? = nil,
        broadcastFrequency: SingleTextConjunction<BroadcastFrequencySpecification>? = nil,
        broadcastTimezone: String? = nil,
        broadcaster: Organization? = nil,
        callSign: String? = nil,
        hasBroadcastChannel: BroadcastChannel? = nil,
        inLanguage: SingleTextConjunction<Language>? = nil,
        parentService: BroadcastService? = nil,
        videoFormat: String? = nil
    ) {
        self.init()
        self.broadcastAffiliateOf = broadcastAffiliateOf
        self.broadcastDisplayName = broadcastDisplayName
        self.broadcastFrequency = broadcastFrequency
        self.broadcastTimezone = broadcastTimezone
        self.broadcaster = broadcaster
        self.callSign = callSign
        self.hasBroadcastChannel = hasBroadcastChannel
        self.inLanguage = inLanguage
        self.parentService = parentService
        self.videoFormat = videoFormat
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: BroadcastServiceCodingKeys.self)
        
        broadcastAffiliateOf = try container.decodeIfPresent(Organization.self, forKey: .broadcastAffiliateOf)
        broadcastDisplayName = try container.decodeIfPresent(String.self, forKey: .broadcastDisplayName)
        broadcastFrequency = try container.decodeIfPresent(SingleTextConjunction<BroadcastFrequencySpecification>.self, forKey: .broadcastFrequency)
        broadcastTimezone = try container.decodeIfPresent(String.self, forKey: .broadcastTimezone)
        broadcaster = try container.decodeIfPresent(Organization.self, forKey: .broadcaster)
        callSign = try container.decodeIfPresent(String.self, forKey: .callSign)
        hasBroadcastChannel = try container.decodeIfPresent(BroadcastChannel.self, forKey: .hasBroadcastChannel)
        inLanguage = try container.decodeIfPresent(SingleTextConjunction<Language>.self, forKey: .inLanguage)
        parentService = try container.decodeIfPresent(BroadcastService.self, forKey: .parentService)
        videoFormat = try container.decodeIfPresent(String.self, forKey: .videoFormat)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BroadcastServiceCodingKeys.self)
        
        try container.encodeIfPresent(broadcastAffiliateOf, forKey: .broadcastAffiliateOf)
        try container.encodeIfPresent(broadcastDisplayName, forKey: .broadcastDisplayName)
        try container.encodeIfPresent(broadcastFrequency, forKey: .broadcastFrequency)
        try container.encodeIfPresent(broadcastTimezone, forKey: .broadcastTimezone)
        try container.encodeIfPresent(broadcaster, forKey: .broadcaster)
        try container.encodeIfPresent(callSign, forKey: .callSign)
        try container.encodeIfPresent(hasBroadcastChannel, forKey: .hasBroadcastChannel)
        try container.encodeIfPresent(inLanguage, forKey: .inLanguage)
        try container.encodeIfPresent(parentService, forKey: .parentService)
        try container.encodeIfPresent(videoFormat, forKey: .videoFormat)
        
        try super.encode(to: encoder)
    }
}
