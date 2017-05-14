import Foundation

/// A review of an item - for example, of a restaurant, movie, or store.
public protocol Review: CreativeWork {
    /// The item that is being reviewed/rated.
    var itemReviewed: Thing? { get set }
    /// The actual body of the review.
    var reviewBody: String? { get set }
    /// The rating given in this review.
    /// - note: Reviews can themselves be rated. The reviewRating applies to rating given by the review. The aggregateRating property applies to the review itself, as a creative work.
    var reviewRating: Rating? { get set }
}

