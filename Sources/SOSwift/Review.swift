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
    
}
