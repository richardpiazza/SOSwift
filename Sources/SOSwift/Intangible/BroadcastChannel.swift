/// A unique instance of a `BroadcastService` on a `CableOrSatelliteService` lineup.
public class BroadcastChannel: Intangible {
    /// The unique address by which the `BroadcastService` can be identified in a provider lineup.
    ///
    /// In US, this is typically a number.
    public var broadcastChannelId: String?

    /// The frequency used for over-the-air broadcasts.
    ///
    /// Numeric values or simple ranges, e.g. 87-99. In addition a shortcut idiom is supported for frequencies of AM and FM radio channels, e.g. "87 FM".
    public var broadcastFrequency: SingleTextConjunction<BroadcastFrequencySpecification>?

    /// The type of service required to have access to the channel (e.g. Standard or Premium).
    public var broadcastServiceTier: String?

    /// Genre of the creative work, broadcast channel or group.
    public var genre: URLOrText?

    /// The `CableOrSatelliteService` offering the channel.
    public var inBroadcastLineup: CableOrSatelliteService?

    /// The `BroadcastService` offered on this channel.
    ///
    /// Inverse property: hasBroadcastChannel
    public var providesBroadcastService: BroadcastService?

    enum BroadcastChannelCodingKeys: String, CodingKey {
        case broadcastChannelId
        case broadcastFrequency
        case broadcastServiceTier
        case genre
        case inBroadcastLineup
        case providesBroadcastService
    }

    override public init() {
        super.init()
    }

    public convenience init(
        broadcastChannelId: String? = nil,
        broadcastFrequency: SingleTextConjunction<BroadcastFrequencySpecification>? = nil,
        broadcastServiceTier: String? = nil,
        genre: URLOrText? = nil,
        inBroadcastLineup: CableOrSatelliteService? = nil,
        providesBroadcastService: BroadcastService? = nil
    ) {
        self.init()
        self.broadcastChannelId = broadcastChannelId
        self.broadcastFrequency = broadcastFrequency
        self.broadcastServiceTier = broadcastServiceTier
        self.genre = genre
        self.inBroadcastLineup = inBroadcastLineup
        self.providesBroadcastService = providesBroadcastService
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: BroadcastChannelCodingKeys.self)

        broadcastChannelId = try container.decodeIfPresent(String.self, forKey: .broadcastChannelId)
        broadcastFrequency = try container.decodeIfPresent(SingleTextConjunction<BroadcastFrequencySpecification>.self, forKey: .broadcastFrequency)
        broadcastServiceTier = try container.decodeIfPresent(String.self, forKey: .broadcastServiceTier)
        genre = try container.decodeIfPresent(URLOrText.self, forKey: .genre)
        inBroadcastLineup = try container.decodeIfPresent(CableOrSatelliteService.self, forKey: .inBroadcastLineup)
        providesBroadcastService = try container.decodeIfPresent(BroadcastService.self, forKey: .providesBroadcastService)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BroadcastChannelCodingKeys.self)

        try container.encodeIfPresent(broadcastChannelId, forKey: .broadcastChannelId)
        try container.encodeIfPresent(broadcastFrequency, forKey: .broadcastFrequency)
        try container.encodeIfPresent(broadcastServiceTier, forKey: .broadcastServiceTier)
        try container.encodeIfPresent(genre, forKey: .genre)
        try container.encodeIfPresent(inBroadcastLineup, forKey: .inBroadcastLineup)
        try container.encodeIfPresent(providesBroadcastService, forKey: .providesBroadcastService)

        try super.encode(to: encoder)
    }
}
