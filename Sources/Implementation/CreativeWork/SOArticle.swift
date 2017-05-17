import Foundation

/// An article, such as a news article or piece of investigative report.
/// Newspapers and magazines have articles of many different types and this is intended to cover them all.
public class SOArticle: SOCreativeWork, Article {
    public struct Keys {
        public static let articleBody = "articleBody"
        public static let articleSection = "articleSection"
        public static let pageEnd = "pageEnd"
        public static let pageStart = "pageStart"
        public static let pagination = "pagination"
        public static let wordCount = "wordCount"
    }
    
    override public class var type: String {
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.articleBody] as? String {
            self.articleBody = value
        }
        if let value = dictionary[Keys.articleSection] as? String {
            self.articleSection = value
        }
        if let value = dictionary[Keys.pageEnd] {
            self.pageEnd = makeIntegerOrText(anyObject: value)
        }
        if let value = dictionary[Keys.pageStart] {
            self.pageStart = makeIntegerOrText(anyObject: value)
        }
        if let value = dictionary[Keys.pagination] as? String {
            self.pagination = value
        }
        if let value = dictionary[Keys.wordCount] as? Int {
            self.wordCount = value
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.articleBody {
            dictionary[Keys.articleBody] = value as AnyObject
        }
        if let value = self.articleSection {
            dictionary[Keys.articleSection] = value as AnyObject
        }
        if let value = self.pageEnd?.dictionaryValue {
            dictionary[Keys.pageEnd] = value
        }
        if let value = self.pageStart?.dictionaryValue {
            dictionary[Keys.pageStart] = value
        }
        if let value = self.pagination {
            dictionary[Keys.pagination] = value as AnyObject
        }
        if let value = self.wordCount {
            dictionary[Keys.wordCount] = value as AnyObject
        }
        return dictionary
    }
}
