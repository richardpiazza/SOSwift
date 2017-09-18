import Foundation

/// The average rating based on multiple ratings or reviews.
public protocol AggregateRating: Rating {
    /// The item that is being reviewed/rated.
    var itemReviewed: Thing? { get set }
    /// The count of total number of ratings.
    var ratingCount: Int? { get set }
    /// The count of total number of reviews.
    var reviewCount: Int? { get set }
}
