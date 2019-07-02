import Foundation

public class Brand: Intangible {
    
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    
    /// A review of the item.
    /// - **schema.org property name**: _review_
    public var reviews: [Review]?
    
    internal enum BrandCodingKeys: String, CodingKey {
        case aggregateRating
        case logo
        case reviews = "review"
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: BrandCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BrandCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
