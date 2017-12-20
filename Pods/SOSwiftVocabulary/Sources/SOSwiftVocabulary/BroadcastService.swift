import Foundation

/// A delivery service through which content is provided via broadcast over the air or online.
public protocol BroadcastService: Service {
    /// The media network(s) whose content is broadcast on this station.
    var broadcastAffiliateOf: Organization? { get set }
    /// The name displayed in the channel guide. For many US affiliates, it is the network name.
    var broadcastDisplayName: String? { get set }
    /// The timezone in ISO 8601 format for which the service bases its broadcasts
    var broadcastTimezone: String? { get set }
    /// The organization owning or operating the broadcast service.
    var broadcaster: Organization? { get set }
    /// A broadcast service to which the broadcast service may belong to such as regional variations of a national channel.
    var parentService: BroadcastService? { get set }
    /// The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).
    var videoFormat: String? { get set }
}
