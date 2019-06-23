import Foundation

public class Article: CreativeWork {
    
    /// The actual body of the article.
    public var articleBody: String?
    
    /// Articles may belong to one or more 'sections' in a magazine or newspaper,
    /// such as Sports, Lifestyle, etc.
    public var articleSection: String?
    
    /// The page on which the work ends; for example "138" or "xvi".
    public var pageEnd: IntegerOrText?
    
    /// The page on which the work starts; for example "135" or "xiii".
    public var pageStart: IntegerOrText?
    
    /// Any description of pages that is not separated into pageStart and pageEnd;
    /// for example, "1-6, 9, 55" or "10-12, 46-49".
    public var pagination: String?
    
    /// The number of words in the text of the Article.
    public var wordCount: Int?
    
}
