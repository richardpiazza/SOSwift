import Foundation
import SOSwiftVocabulary

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
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.aggregateRating.rawValue:
            return " The overall rating, based on a collection of reviews or ratings, of the item."
        case CodingKeys.logo.rawValue:
            return "An associated logo."
        case String(describing: CodingKeys.reviews):
            return "A review of the item."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.aggregateRating.rawValue:
            setAggregateRating(value)
        case CodingKeys.logo.rawValue:
            setLogo(value)
        case "reviews":
            setReviews(value)
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension SOBrand {
    func setAggregateRating(_ value: Any?) {
        guard let nonNil = value else {
            self.aggregateRating = nil
            return
        }
        
        guard let typedValue = nonNil as? AggregateRating else {
            return
        }
        
        self.aggregateRating = typedValue
    }
    
    func setLogo(_ value: Any?) {
        guard let nonNil = value else {
            self.logo = nil
            return
        }
        
        guard let typedValue = nonNil as? ImageObjectOrURL else {
            return
        }
        
        self.logo = typedValue
    }
    
    func setReviews(_ value: Any?) {
        guard let nonNil = value else {
            self.reviews = nil
            return
        }
        
        guard let typedValue = nonNil as? [Review] else {
            return
        }
        
        self.reviews = typedValue
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Brand?, forKey key: K) throws {
        if let typedValue = value as? SOBrand {
            try self.encode(typedValue, forKey: key)
        }
    }
}
