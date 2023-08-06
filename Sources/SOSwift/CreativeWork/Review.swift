import Foundation

/// A review of an item - for example, of a restaurant, movie, or store.
public class Review: CreativeWork {
    
    /// The item that is being reviewed/rated.
    public var itemReviewed: Thing?
    
    /// This Review or Rating is relevant to this part or facet of the
    /// `itemReviewed`.
    public var reviewAspect: String?
    
    /// The actual body of the review.
    public var reviewBody: String?
    
    /// The rating given in this review.
    /// - note: Reviews can themselves be rated. The reviewRating applies
    ///         to rating given by the review. The aggregateRating property
    ///         applies to the review itself, as a creative work.
    public var reviewRating: Rating?
    
    internal enum ReviewCodingKeys: String, CodingKey {
        case itemReviewed
        case reviewAspect
        case reviewBody
        case reviewRating
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: ReviewCodingKeys.self)
        
        itemReviewed = try container.decodeIfPresent(Thing.self, forKey: .itemReviewed)
        reviewAspect = try container.decodeIfPresent(String.self, forKey: .reviewAspect)
        reviewBody = try container.decodeIfPresent(String.self, forKey: .reviewBody)
        reviewRating = try container.decodeIfPresent(Rating.self, forKey: .reviewRating)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ReviewCodingKeys.self)
        
        try container.encodeIfPresent(itemReviewed, forKey: .itemReviewed)
        try container.encodeIfPresent(reviewAspect, forKey: .reviewAspect)
        try container.encodeIfPresent(reviewBody, forKey: .reviewBody)
        try container.encodeIfPresent(reviewRating, forKey: .reviewRating)
        
        try super.encode(to: encoder)
    }
}
