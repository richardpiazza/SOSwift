import Foundation

public class SOAggregateRating: SORating, AggregateRating {
    override public class var type: String {
        return "AggregateRating"
    }
    
    /// The item that is being reviewed/rated.
    public var itemReviewed: Thing?
    /// The count of total number of ratings.
    public var ratingCount: Int?
    /// The count of total number of reviews.
    public var reviewCount: Int?
}
