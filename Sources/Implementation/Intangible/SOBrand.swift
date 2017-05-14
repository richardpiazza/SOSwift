import Foundation

/// A brand is a name used by an organization or business person for labeling a product, product group, or similar.
public class SOBrand: SOIntangible, Brand {
    override public class var type: String {
        return "Brand"
    }
    
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    /// A review of the item.
    public var review: [Review]?
}
