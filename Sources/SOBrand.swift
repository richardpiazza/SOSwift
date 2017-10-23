import Foundation
import SOSwiftVocabulary

/// A brand is a name used by an organization or business person for labeling a product, product group, or similar.
public class SOBrand: SOIntangible, Brand {
    
    public override class var type: String {
        return "Brand"
    }
    
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    /// A review of the item.
    public var review: [Review]?
    
    private enum CodingKeys: String, CodingKey {
        case aggregateRating
        case logo
        case review
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating) {
            self.aggregateRating = value
        }
        if let value = try container.decodeImageObjectOrURLIfPresent(forKey: .logo) {
            self.logo = value
        }
        if let value = try container.decodeIfPresent([SOReview].self, forKey: .review) {
            self.review = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.aggregateRating as? SOAggregateRating {
            try container.encode(value, forKey: .aggregateRating)
        }
        if let value = self.logo {
            try container.encodeImageObjectOrURL(value, forKey: .logo)
        }
        if let value = self.review as? [SOReview] {
            try container.encode(value, forKey: .review)
        }
        
        try super.encode(to: encoder)
    }
}
