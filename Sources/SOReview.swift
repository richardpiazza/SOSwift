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
        
        self.itemReviewed = try container.decodeIfPresent(SOThing.self, forKey: .itemReviewed)
        self.reviewBody = try container.decodeIfPresent(String.self, forKey: .reviewBody)
        self.reviewRating = try container.decodeIfPresent(SORating.self, forKey: .reviewRating)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.itemReviewed, forKey: .itemReviewed)
        try container.encodeIfPresent(self.reviewBody, forKey: .reviewBody)
        try container.encodeIfPresent(self.reviewRating, forKey: .reviewRating)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Review?, forKey key: K) throws {
        if let typedValue = value as? SOReview {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [Review]?, forKey key: K) throws {
        if let typedValue = value as? [SOReview] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
