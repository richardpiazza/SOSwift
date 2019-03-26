import Foundation
import SOSwiftVocabulary

public class SOInteractionCounter: SOStructuredValue, InteractionCounter {
    
    public override class var type: String {
        return "InteractionCounter"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The WebSite or SoftwareApplication where the interactions took place.
    public var interactionService: SoftwareApplicationOrWebsite?
    /// The Action representing the type of interaction. For up votes, +1s, etc. use LikeAction. For down votes use DislikeAction. Otherwise, use the most specific Action.
    public var interactionType: Action?
    /// The number of interactions for the CreativeWork using the WebSite or SoftwareApplication.
    public var userInteractionCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case interactionService
        case interactionType
        case userInteractionCount
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.interactionService = try container.decodeSoftwareApplicationOrWebsiteIfPresent(forKey: .interactionService)
        self.interactionType = try container.decodeIfPresent(SOAction.self, forKey: .interactionType)
        self.userInteractionCount = try container.decodeIfPresent(Int.self, forKey: .userInteractionCount)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.interactionService, forKey: .interactionService)
        try container.encodeIfPresent(self.interactionType, forKey: .interactionType)
        try container.encodeIfPresent(self.userInteractionCount, forKey: .userInteractionCount)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.interactionService.rawValue:
            return "The WebSite or SoftwareApplication where the interactions took place."
        case CodingKeys.interactionType.rawValue:
            return "The Action representing the type of interaction."
        case CodingKeys.userInteractionCount.rawValue:
            return "The number of interactions for the CreativeWork using the WebSite or SoftwareApplication."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.interactionService.rawValue:
            self.interactionService = value as? SoftwareApplicationOrWebsite
        case CodingKeys.interactionType.rawValue:
            self.interactionType = value as? Action
        case CodingKeys.userInteractionCount.rawValue:
            self.userInteractionCount = value as? Int
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: InteractionCounter?, forKey key: K) throws {
        if let typedValue = value as? SOInteractionCounter {
            try self.encode(typedValue, forKey: key)
        }
    }
}
