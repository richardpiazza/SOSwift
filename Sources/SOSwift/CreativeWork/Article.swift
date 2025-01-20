import Foundation

/// An article, such as a news article or piece of investigative report.
///
/// Newspapers and magazines have articles of many different types and this is intended to cover them all.
public class Article: CreativeWork {

    /// The actual body of the article.
    public var articleBody: String?

    /// Articles may belong to one or more 'sections' in a magazine or newspaper, such as Sports, Lifestyle, etc.
    public var articleSection: String?

    /// The page on which the work ends; for example "138" or "xvi".
    public var pageEnd: IntegerOrText?

    /// The page on which the work starts; for example "135" or "xiii".
    public var pageStart: IntegerOrText?

    /// Any description of pages that is not separated into pageStart and pageEnd.
    ///
    /// ## For Example
    /// * "1-6, 9, 55"
    /// * "10-12, 46-49"
    public var pagination: String?

    /// The number of words in the text of the Article.
    public var wordCount: Int?

    enum ArticleCodingKeys: String, CodingKey {
        case articleBody
        case articleSection
        case pageEnd
        case pageStart
        case pagination
        case wordCount
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: ArticleCodingKeys.self)

        articleBody = try container.decodeIfPresent(String.self, forKey: .articleBody)
        articleSection = try container.decodeIfPresent(String.self, forKey: .articleSection)
        pageEnd = try container.decodeIfPresent(IntegerOrText.self, forKey: .pageEnd)
        pageStart = try container.decodeIfPresent(IntegerOrText.self, forKey: .pageStart)
        pagination = try container.decodeIfPresent(String.self, forKey: .pagination)
        wordCount = try container.decodeIfPresent(Int.self, forKey: .wordCount)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ArticleCodingKeys.self)

        try container.encodeIfPresent(articleBody, forKey: .articleBody)
        try container.encodeIfPresent(articleSection, forKey: .articleSection)
        try container.encodeIfPresent(pageEnd, forKey: .pageEnd)
        try container.encodeIfPresent(pageStart, forKey: .pageStart)
        try container.encodeIfPresent(pagination, forKey: .pagination)
        try container.encodeIfPresent(wordCount, forKey: .wordCount)

        try super.encode(to: encoder)
    }
}
