import Foundation

/// A summary of how users have interacted with this CreativeWork. In most cases, authors will use a subtype to specify the specific type of interaction.
public protocol InteractionCounter: StructuredValue {
    /// The WebSite or SoftwareApplication where the interactions took place.
    var interactionService: SoftwareApplicationOrWebsite? { get set }
    /// The Action representing the type of interaction. For up votes, +1s, etc. use LikeAction. For down votes use DislikeAction. Otherwise, use the most specific Action.
    var interactionType: Action? { get set }
    /// The number of interactions for the CreativeWork using the WebSite or SoftwareApplication.
    var userInteractionCount: Int? { get set }
}
