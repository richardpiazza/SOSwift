import Foundation

public class InteractionCounter: StructuredValue {
    
    /// The WebSite or SoftwareApplication where the interactions took place.
    public var interactionService: SoftwareApplicationOrWebsite?
    
    /// The Action representing the type of interaction. For up votes, +1s, etc. use
    /// LikeAction. For down votes use DislikeAction. Otherwise, use the most
    /// specific Action.
    public var interactionType: Action?
    
    /// The number of interactions for the CreativeWork using the WebSite or
    /// SoftwareApplication.
    public var userInteractionCount: Int?
    
    internal enum InteractionCounterCodingKeys: String, CodingKey {
        case interactionService
        case interactionType
        case userInteractionCount
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: InteractionCounterCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: InteractionCounterCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
