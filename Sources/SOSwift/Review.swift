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
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ReviewCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
