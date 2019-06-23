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
    
}
