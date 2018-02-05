import Foundation
import SOSwiftVocabulary

public class SOBroadcastService: SOService, BroadcastService {
    
    public override class var type: String {
        return "BroadcastService"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.broadcastAffiliateOf = try container.decodeIfPresent(SOOrganization.self, forKey: .broadcastAffiliateOf)
        self.broadcastDisplayName = try container.decodeIfPresent(String.self, forKey: .broadcastDisplayName)
        self.broadcastTimezone = try container.decodeIfPresent(String.self, forKey: .broadcastTimezone)
        self.broadcaster = try container.decodeIfPresent(SOOrganization.self, forKey: .broadcaster)
        self.parentService = try container.decodeIfPresent(SOBroadcastService.self, forKey: .parentService)
        self.videoFormat = try container.decodeIfPresent(String.self, forKey: .videoFormat)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.broadcastAffiliateOf, forKey: .broadcastAffiliateOf)
        try container.encodeIfPresent(self.broadcastDisplayName, forKey: .broadcastDisplayName)
        try container.encodeIfPresent(self.broadcastTimezone, forKey: .broadcastTimezone)
        try container.encodeIfPresent(self.broadcaster, forKey: .broadcaster)
        try container.encodeIfPresent(self.parentService, forKey: .parentService)
        try container.encodeIfPresent(self.videoFormat, forKey: .videoFormat)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.broadcastAffiliateOf.rawValue:
            return "The media network(s) whose content is broadcast on this station."
        case CodingKeys.broadcastDisplayName.rawValue:
            return "The name displayed in the channel guide. For many US affiliates, it is the network name."
        case CodingKeys.broadcastTimezone.rawValue:
            return "The timezone in ISO 8601 format for which the service bases its broadcasts."
        case CodingKeys.broadcaster.rawValue:
            return "The organization owning or operating the broadcast service."
        case CodingKeys.parentService.rawValue:
            return "A broadcast service to which the broadcast service may belong to such as regional variations of a national channel."
        case CodingKeys.videoFormat.rawValue:
            return "The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.)."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.broadcastAffiliateOf.rawValue:
            self.broadcastAffiliateOf = value as? Organization
        case CodingKeys.broadcastDisplayName.rawValue:
            self.broadcastDisplayName = value as? String
        case CodingKeys.broadcastTimezone.rawValue:
            self.broadcastTimezone = value as? String
        case CodingKeys.broadcaster.rawValue:
            self.broadcaster = value as? Organization
        case CodingKeys.parentService.rawValue:
            self.parentService = value as? BroadcastService
        case CodingKeys.videoFormat.rawValue:
            self.videoFormat = value as? String
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: BroadcastService?, forKey key: K) throws {
        if let typedValue = value as? SOBroadcastService {
            try self.encode(typedValue, forKey: key)
        }
    }
}
