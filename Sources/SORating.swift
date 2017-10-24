import Foundation
import SOSwiftVocabulary

public class SORating: SOIntangible, Rating {
    
    public override class var type: String {
        return "Rating"
    }
    
    /// The author of this content or rating.
    /// - note: The author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.
    public var author: OrganizationOrPerson?
    /// The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.
    public var bestRating: NumberOrText?
    /// The rating for the content.
    public var ratingValue: NumberOrText?
    /// The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.
    public var worstRating: NumberOrText?
    
    private enum CodingKeys: String, CodingKey {
        case author
        case bestRating
        case ratingValue
        case worstRating
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.author = try container.decodeOrganizationOrPersonIfPresent(forKey: .author)
        self.bestRating = try container.decodeNumberOrTextIfPresent(forKey: .bestRating)
        self.ratingValue = try container.decodeNumberOrTextIfPresent(forKey: .ratingValue)
        self.worstRating = try container.decodeNumberOrTextIfPresent(forKey: .worstRating)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.bestRating, forKey: .bestRating)
        try container.encodeIfPresent(self.ratingValue, forKey: .ratingValue)
        try container.encodeIfPresent(self.worstRating, forKey: .worstRating)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Rating?, forKey key: K) throws {
        if let typedValue = value as? SORating {
            try self.encode(typedValue, forKey: key)
        }
    }
}
