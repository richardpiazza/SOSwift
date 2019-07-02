import Foundation

public class AggregateRating: Rating {
    
    /// The item that is being reviewed/rated.
    public var itemReviewed: Thing?
    
    /// The count of total number of ratings.
    public var ratingCount: Int?
    
    /// The count of total number of reviews.
    public var reviewCount: Int?
    
    internal enum AggregateRatingCodingKeys: String, CodingKey {
        case itemReviewed
        case ratingCount
        case reviewCount
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: AggregateRatingCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AggregateRatingCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
