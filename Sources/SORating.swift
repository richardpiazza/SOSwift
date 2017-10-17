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
        
        if let value = try container.decodeOrganizationOrPersonIfPresent(forKey: .author) {
            self.author = value
        }
        if let value = try container.decodeNumberOrTextIfPresent(forKey: .bestRating) {
            self.bestRating = value
        }
        if let value = try container.decodeNumberOrTextIfPresent(forKey: .ratingValue) {
            self.ratingValue = value
        }
        if let value = try container.decodeNumberOrTextIfPresent(forKey: .worstRating) {
            self.worstRating = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.author {
            try container.encodeOrganizationOrPerson(value, forKey: .author)
        }
        if let value = self.bestRating {
            try container.encodeNumberOrText(value, forKey: .bestRating)
        }
        if let value = self.ratingValue {
            try container.encodeNumberOrText(value, forKey: .ratingValue)
        }
        if let value = self.worstRating {
            try container.encodeNumberOrText(value, forKey: .worstRating)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
