import Foundation
import SOSwiftVocabulary

/// An article, such as a news article or piece of investigative report.
/// Newspapers and magazines have articles of many different types and this is intended to cover them all.
public class SOArticle: SOCreativeWork, Article {

    public override class var type: String {
        return "Article"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [SONewsArticle.self]
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.articleBody = try container.decodeIfPresent(String.self, forKey: .articleBody)
        self.articleSection = try container.decodeIfPresent(String.self, forKey: .articleSection)
        self.pageEnd = try container.decodeIntegerOrTextIfPresent(forKey: .pageEnd)
        self.pageStart = try container.decodeIntegerOrTextIfPresent(forKey: .pageStart)
        self.pagination = try container.decodeIfPresent(String.self, forKey: .pagination)
        self.wordCount = try container.decodeIfPresent(Int.self, forKey: .wordCount)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.articleBody, forKey: .articleBody)
        try container.encodeIfPresent(self.articleSection, forKey: .articleSection)
        try container.encodeIfPresent(self.pageEnd, forKey: .pageEnd)
        try container.encodeIfPresent(self.pageStart, forKey: .pageStart)
        try container.encodeIfPresent(self.pagination, forKey: .pagination)
        try container.encodeIfPresent(self.wordCount, forKey: .wordCount)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.articleBody.rawValue:
            return "The actual body of the article."
        case CodingKeys.articleSection.rawValue:
            return "Articles may belong to one or more 'sections' in a magazine or newspaper, such as Sports, Lifestyle, etc."
        case CodingKeys.pageEnd.rawValue:
            return "The page on which the work ends."
        case CodingKeys.pageStart.rawValue:
            return "The page on which the work starts."
        case CodingKeys.pagination.rawValue:
            return "Any description of pages that is not separated into Page Start and Page End."
        case CodingKeys.wordCount.rawValue:
            return "The number of words in the text of the Article."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.articleBody.rawValue:
            self.articleBody = value as? String
        case CodingKeys.articleSection.rawValue:
            self.articleSection = value as? String
        case CodingKeys.pageEnd.rawValue:
            self.pageEnd = value as? IntegerOrText
        case CodingKeys.pageStart.rawValue:
            self.pageStart = value as? IntegerOrText
        case CodingKeys.pagination.rawValue:
            self.pagination = value as? String
        case CodingKeys.wordCount.rawValue:
            self.wordCount = value as? Int
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Article?, forKey key: K) throws {
        if let typedValue = value as? SOArticle {
            try self.encode(typedValue, forKey: key)
        }
    }
}