import Foundation

public class SOReview: SOCreativeWork, Review {
    override public class var type: String {
        return "Review"
    }
    
    /// The item that is being reviewed/rated.
    public var itemReviewed: Thing?
    /// The actual body of the review.
    public var reviewBody: String?
    /// The rating given in this review.
    /// - note: Reviews can themselves be rated. The reviewRating applies to rating given by the review. The aggregateRating property applies to the review itself, as a creative work.
    public var reviewRating: Rating?
}
