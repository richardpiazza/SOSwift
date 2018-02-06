import Foundation
import SOSwiftVocabulary

public class SORating: SOIntangible, Rating {
    
    public override class var type: String {
        return "Rating"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOAggregateRating.self
        ]
    }
    
    /// The author of this content or rating.
    /// - note: The author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.
    public var author: OrganizationOrPerson?
    /// The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.
    public var bestRating: NumberOrText?
    /// The rating for the content.
    public var ratingValue: NumberOrText?
    /// This Review or Rating is relevant to this part or facet of the itemReviewed.
    public var reviewAspect: String?
    /// The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.
    public var worstRating: NumberOrText?
    
    private enum CodingKeys: String, CodingKey {
        case author
        case bestRating
        case ratingValue
        case reviewAspect
        case worstRating
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.author = try container.decodeOrganizationOrPersonIfPresent(forKey: .author)
        self.bestRating = try container.decodeNumberOrTextIfPresent(forKey: .bestRating)
        self.ratingValue = try container.decodeNumberOrTextIfPresent(forKey: .ratingValue)
        self.reviewAspect = try container.decodeIfPresent(String.self, forKey: .reviewAspect)
        self.worstRating = try container.decodeNumberOrTextIfPresent(forKey: .worstRating)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.bestRating, forKey: .bestRating)
        try container.encodeIfPresent(self.ratingValue, forKey: .ratingValue)
        try container.encodeIfPresent(self.reviewAspect, forKey: .reviewAspect)
        try container.encodeIfPresent(self.worstRating, forKey: .worstRating)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.author.rawValue:
            return "The author of this content or rating."
        case CodingKeys.bestRating.rawValue:
            return "The highest value allowed in this rating system."
        case CodingKeys.ratingValue.rawValue:
            return "The rating for the content."
        case CodingKeys.reviewAspect.rawValue:
            return "This Review or Rating is relevant to this part or facet of the itemReviewed."
        case CodingKeys.worstRating.rawValue:
            return "The lowest value allowed in this rating system."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.author.rawValue:
            self.author = value as? OrganizationOrPerson
        case CodingKeys.bestRating.rawValue:
            self.bestRating = value as? NumberOrText
        case CodingKeys.ratingValue.rawValue:
            self.ratingValue = value as? NumberOrText
        case CodingKeys.reviewAspect.rawValue:
            self.reviewAspect = value as? String
        case CodingKeys.worstRating.rawValue:
            self.worstRating = value as? NumberOrText
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Rating?, forKey key: K) throws {
        if let typedValue = value as? SORating {
            try self.encode(typedValue, forKey: key)
        }
    }
}
