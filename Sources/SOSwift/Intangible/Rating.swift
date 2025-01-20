import Foundation

public class Rating: Intangible {

    /// The author of this content or rating.
    /// - note: The author is special in that HTML 5 provides a special
    ///         mechanism for indicating authorship via the rel tag. That
    ///         is equivalent to this and may be used interchangeably.
    public var author: OrganizationOrPerson?

    /// The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.
    public var bestRating: NumberOrText?

    /// The rating for the content.
    public var ratingValue: NumberOrText?

    /// This Review or Rating is relevant to this part or facet of the itemReviewed.
    public var reviewAspect: String?

    /// The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.
    public var worstRating: NumberOrText?

    enum RatingCodingKeys: String, CodingKey {
        case author
        case bestRating
        case ratingValue
        case reviewAspect
        case worstRating
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: RatingCodingKeys.self)

        author = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .author)
        bestRating = try container.decodeIfPresent(NumberOrText.self, forKey: .bestRating)
        ratingValue = try container.decodeIfPresent(NumberOrText.self, forKey: .ratingValue)
        reviewAspect = try container.decodeIfPresent(String.self, forKey: .reviewAspect)
        worstRating = try container.decodeIfPresent(NumberOrText.self, forKey: .worstRating)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RatingCodingKeys.self)

        try container.encodeIfPresent(author, forKey: .author)
        try container.encodeIfPresent(bestRating, forKey: .bestRating)
        try container.encodeIfPresent(ratingValue, forKey: .ratingValue)
        try container.encodeIfPresent(reviewAspect, forKey: .reviewAspect)
        try container.encodeIfPresent(worstRating, forKey: .worstRating)

        try super.encode(to: encoder)
    }
}
