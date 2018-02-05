import Foundation
import SOSwiftVocabulary_ObjC

/// A brand is a name used by an organization or business person for labeling a product, product group, or similar.
public class SOBrand: SOIntangible, Brand {
    
    public override class var type: String {
        return "Brand"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    /// A review of the item.
    /// - schema.org property name: review
    public var reviews: [Review]?
    
    private enum CodingKeys: String, CodingKey {
        case aggregateRating
        case logo
        case reviews = "review"
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.aggregateRating = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating)
        self.logo = try container.decodeImageObjectOrURLIfPresent(forKey: .logo)
        self.reviews = try container.decodeArrayOrElementIfPresent(SOReview.self, forKey: .reviews)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(self.logo, forKey: .logo)
        try container.encodeIfPresent(self.reviews, forKey: .reviews)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Brand?, forKey key: K) throws {
        if let typedValue = value as? SOBrand {
            try self.encode(typedValue, forKey: key)
        }
    }
}