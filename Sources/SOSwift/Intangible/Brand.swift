import Foundation

/// A brand is a name used by an organization or business person for labeling a product, product group, or similar.
public class Brand: Intangible {

    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?

    /// An associated logo.
    public var logo: ImageObjectOrURL?

    /// A review of the item.
    ///
    /// ## Schema.org Property Name
    /// _review_
    public var reviews: [Review]?

    enum BrandCodingKeys: String, CodingKey {
        case aggregateRating
        case logo
        case reviews = "review"
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: BrandCodingKeys.self)

        aggregateRating = try container.decodeIfPresent(AggregateRating.self, forKey: .aggregateRating)
        logo = try container.decodeIfPresent(ImageObjectOrURL.self, forKey: .logo)
        reviews = try container.decodeIfPresent([Review].self, forKey: .reviews)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BrandCodingKeys.self)

        try container.encodeIfPresent(aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(logo, forKey: .logo)
        try container.encodeIfPresent(reviews, forKey: .reviews)

        try super.encode(to: encoder)
    }
}
