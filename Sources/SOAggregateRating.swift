import Foundation
import SOSwiftVocabulary

public class SOAggregateRating: SORating, AggregateRating {
    
    public override class var type: String {
        return "AggregateRating"
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .itemReviewed) {
            self.itemReviewed = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .ratingCount) {
            self.ratingCount = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .reviewCount) {
            self.reviewCount = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.itemReviewed as? SOThing {
            try container.encode(value, forKey: .itemReviewed)
        }
        if let value = self.ratingCount {
            try container.encode(value, forKey: .ratingCount)
        }
        if let value = self.reviewCount {
            try container.encode(value, forKey: .reviewCount)
        }
        
        try super.encode(to: encoder)
    }
}
