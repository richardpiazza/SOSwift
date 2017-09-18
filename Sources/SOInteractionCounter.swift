import Foundation
import SOSwiftVocabulary

public class SOInteractionCounter: SOStructuredValue, InteractionCounter {
    override public class var type: String {
        return "InteractionCounter"
    }
    
    /// The WebSite or SoftwareApplication where the interactions took place.
    public var interactionService: SoftwareApplicationOrWebsite?
    /// The Action representing the type of interaction. For up votes, +1s, etc. use LikeAction. For down votes use DislikeAction. Otherwise, use the most specific Action.
    public var interactionType: Action?
    /// The number of interactions for the CreativeWork using the WebSite or SoftwareApplication.
    public var userInteractionCount: Int?
}
