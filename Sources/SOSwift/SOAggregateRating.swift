import Foundation
import SOSwiftVocabulary

public class SOAggregateRating: SORating, AggregateRating {
    
    public override class var type: String {
        return "AggregateRating"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The item that is being reviewed/rated.
    public var itemReviewed: Thing?
    /// The count of total number of ratings.
    public var ratingCount: Int?
    /// The count of total number of reviews.
    public var reviewCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case itemReviewed
        case ratingCount
        case reviewCount
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.itemReviewed = try container.decodeIfPresent(SOThing.self, forKey: .itemReviewed)
        self.ratingCount = try container.decodeIfPresent(Int.self, forKey: .ratingCount)
        self.reviewCount = try container.decodeIfPresent(Int.self, forKey: .reviewCount)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.itemReviewed, forKey: .itemReviewed)
        try container.encodeIfPresent(self.ratingCount, forKey: .ratingCount)
        try container.encodeIfPresent(self.reviewCount, forKey: .reviewCount)
        
        try super.encode(to: encoder)
    }
}
