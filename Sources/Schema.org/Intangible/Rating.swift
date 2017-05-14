import Foundation

/// A rating is an evaluation on a numeric scale, such as 1 to 5 stars.
public protocol Rating: Intangible {
    /// The author of this content or rating.
    /// - note: The author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.
    var author: OrganizationOrPerson? { get set }
    /// The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.
    var bestRating: NumberOrText? { get set }
    /// The rating for the content.
    var ratingValue: NumberOrText? { get set }
    /// The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.
    var worstRating: NumberOrText? { get set }
}
