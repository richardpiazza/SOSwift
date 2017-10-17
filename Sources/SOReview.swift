import Foundation
import SOSwiftVocabulary

/// A review of an item - for example, of a restaurant, movie, or store.
public class SOReview: SOCreativeWork, Review {
    
    public override class var type: String {
        return "Review"
    }
    
    /// The item that is being reviewed/rated.
    public var itemReviewed: Thing?
    /// The actual body of the review.
    public var reviewBody: String?
    /// The rating given in this review.
    /// - note: Reviews can themselves be rated. The reviewRating applies to rating given by the review. The aggregateRating property applies to the review itself, as a creative work.
    public var reviewRating: Rating?
    
    private enum CodingKeys: String, CodingKey {
        case itemReviewed
        case reviewBody
        case reviewRating
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOThing.self, forKey: .itemReviewed) {
            self.itemReviewed = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .reviewBody) {
            self.reviewBody = value
        }
        if let value = try container.decodeIfPresent(SORating.self, forKey: .reviewRating) {
            self.reviewRating = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.itemReviewed as? SOThing {
            try container.encode(value, forKey: .itemReviewed)
        }
        if let value = self.reviewBody {
            try container.encode(value, forKey: .reviewBody)
        }
        if let value = self.reviewRating as? SORating {
            try container.encode(value, forKey: .reviewRating)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
