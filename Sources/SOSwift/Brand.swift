import Foundation

public class Brand: Intangible {
    
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    
    /// A review of the item.
    /// - **schema.org property name**: _review_
    public var reviews: [Review]?
    
    private enum CodingKeys: String, CodingKey {
        case aggregateRating
        case logo
        case reviews = "review"
    }
    
}
