import Foundation

public protocol BrandConformance:
                    BrandOrOrganization
                {}

/// A brand is a name used by an organization or business person for labeling a product, product group, or similar.
public protocol Brand: Intangible, BrandConformance {
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    var aggregateRating: AggregateRating? { get set }
    /// An associated logo.
    var logo: ImageObjectOrURL? { get set }
    /// A review of the item.
    /// - schema.org property name: review
    var reviews: [Review]? { get set }
}
