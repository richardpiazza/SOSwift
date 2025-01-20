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

    enum InteractionCounterCodingKeys: String, CodingKey {
        case interactionService
        case interactionType
        case userInteractionCount
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: InteractionCounterCodingKeys.self)

        interactionService = try container.decodeIfPresent(SoftwareApplicationOrWebsite.self, forKey: .interactionService)
        interactionType = try container.decodeIfPresent(Action.self, forKey: .interactionType)
        userInteractionCount = try container.decodeIfPresent(Int.self, forKey: .userInteractionCount)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: InteractionCounterCodingKeys.self)

        try container.encodeIfPresent(interactionService, forKey: .interactionService)
        try container.encodeIfPresent(interactionType, forKey: .interactionType)
        try container.encodeIfPresent(userInteractionCount, forKey: .userInteractionCount)

        try super.encode(to: encoder)
    }
}
