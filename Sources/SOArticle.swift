import Foundation
import SOSwiftVocabulary

/// An article, such as a news article or piece of investigative report.
/// Newspapers and magazines have articles of many different types and this is intended to cover them all.
public class SOArticle: SOCreativeWork, Article {

    public override class var type: String {
        return "Article"
    }
    
    /// The actual body of the article.
    public var articleBody: String?
    /// Articles may belong to one or more 'sections' in a magazine or newspaper, such as Sports, Lifestyle, etc.
    public var articleSection: String?
    /// The page on which the work ends; for example "138" or "xvi".
    public var pageEnd: IntegerOrText?
    /// The page on which the work starts; for example "135" or "xiii".
    public var pageStart: IntegerOrText?
    /// Any description of pages that is not separated into pageStart and pageEnd; for example, "1-6, 9, 55" or "10-12, 46-49".
    public var pagination: String?
    /// The number of words in the text of the Article.
    public var wordCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case articleBody
        case articleSection
        case pageEnd
        case pageStart
        case pagination
        case wordCount
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .articleBody) {
            self.articleBody = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .articleSection) {
            self.articleSection = value
        }
        if let value = try container.decodeIntegerOrTextIfPresent(forKey: .pageEnd) {
            self.pageEnd = value
        }
        if let value = try container.decodeIntegerOrTextIfPresent(forKey: .pageStart) {
            self.pageStart = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .pagination) {
            self.pagination = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .wordCount) {
            self.wordCount = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.articleBody {
            try container.encode(value, forKey: .articleBody)
        }
        if let value = self.articleSection {
            try container.encode(value, forKey: .articleSection)
        }
        try container.encodeIfPresent(self.pageEnd, forKey: .pageEnd)
        try container.encodeIfPresent(self.pageStart, forKey: .pageStart)
        if let value = self.pagination {
            try container.encode(value, forKey: .pagination)
        }
        if let value = self.wordCount {
            try container.encode(value, forKey: .wordCount)
        }
        
        try super.encode(to: encoder)
    }
}
