import Foundation
import SOSwiftVocabulary_ObjC

public class SOInteractionCounter: SOStructuredValue, InteractionCounter {
    
    public override class var type: String {
        return "InteractionCounter"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return []
    }
    
    /// The WebSite or SoftwareApplication where the interactions took place.
    public var interactionService: SoftwareApplicationOrWebsite?
    /// The Action representing the type of interaction. For up votes, +1s, etc. use LikeAction. For down votes use DislikeAction. Otherwise, use the most specific Action.
    public var interactionType: Action?
    /// The number of interactions for the CreativeWork using the WebSite or SoftwareApplication.
    public var userInteractionCountRawValue: NSNumber?
    
    private enum CodingKeys: String, CodingKey {
        case interactionService
        case interactionType
        case userInteractionCount
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.interactionService = try container.decodeSoftwareApplicationOrWebsiteIfPresent(forKey: .interactionService)
        self.interactionType = try container.decodeIfPresent(SOAction.self, forKey: .interactionType)
        self.userInteractionCount = try container.decodeIfPresent(Int.self, forKey: .userInteractionCount)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.interactionService, forKey: .interactionService)
        try container.encodeIfPresent(self.interactionType, forKey: .interactionType)
        try container.encodeIfPresent(self.userInteractionCount, forKey: .userInteractionCount)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: InteractionCounter?, forKey key: K) throws {
        if let typedValue = value as? SOInteractionCounter {
            try self.encode(typedValue, forKey: key)
        }
    }
}
