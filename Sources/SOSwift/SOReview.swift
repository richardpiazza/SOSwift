import Foundation
import SOSwiftVocabulary

/// A review of an item - for example, of a restaurant, movie, or store.
public class SOReview: SOCreativeWork, Review {
    
    public override class var type: String {
        return "Review"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The item that is being reviewed/rated.
    public var itemReviewed: Thing?
    /// This Review or Rating is relevant to this part or facet of the itemReviewed.
    public var reviewAspect: String?
    /// The actual body of the review.
    public var reviewBody: String?
    /// The rating given in this review.
    /// - note: Reviews can themselves be rated. The reviewRating applies to rating given by the review. The aggregateRating property applies to the review itself, as a creative work.
    public var reviewRating: Rating?
    
    private enum CodingKeys: String, CodingKey {
        case itemReviewed
        case reviewAspect
        case reviewBody
        case reviewRating
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.itemReviewed = try container.decodeIfPresent(SOThing.self, forKey: .itemReviewed)
        self.reviewAspect = try container.decodeIfPresent(String.self, forKey: .reviewAspect)
        self.reviewBody = try container.decodeIfPresent(String.self, forKey: .reviewBody)
        self.reviewRating = try container.decodeIfPresent(SORating.self, forKey: .reviewRating)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.itemReviewed, forKey: .itemReviewed)
        try container.encodeIfPresent(self.reviewAspect, forKey: .reviewAspect)
        try container.encodeIfPresent(self.reviewBody, forKey: .reviewBody)
        try container.encodeIfPresent(self.reviewRating, forKey: .reviewRating)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.itemReviewed.rawValue:
            return "The item that is being reviewed/rated."
        case CodingKeys.reviewAspect.rawValue:
            return "This Review or Rating is relevant to this part or facet of the itemReviewed."
        case CodingKeys.reviewBody.rawValue:
            return "The actual body of the review."
        case CodingKeys.reviewRating.rawValue:
            return "The rating given in this review."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.itemReviewed.rawValue:
            self.itemReviewed = value as? Thing
        case CodingKeys.reviewAspect.rawValue:
            self.reviewAspect = value as? String
        case CodingKeys.reviewBody.rawValue:
            self.reviewBody = value as? String
        case CodingKeys.reviewRating.rawValue:
            self.reviewRating = value as? Rating
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: Review?, forKey key: K) throws {
        if let typedValue = value as? SOReview {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [Review]?, forKey key: K) throws {
        if let typedValue = value as? [SOReview] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
