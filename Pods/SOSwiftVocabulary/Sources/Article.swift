import Foundation

/// An article, such as a news article or piece of investigative report.
/// Newspapers and magazines have articles of many different types and this is intended to cover them all.
public protocol Article: CreativeWork {
    /// The actual body of the article.
    var articleBody: String? { get set }
    /// Articles may belong to one or more 'sections' in a magazine or newspaper, such as Sports, Lifestyle, etc.
    var articleSection: String? { get set }
    /// The page on which the work ends; for example "138" or "xvi".
    var pageEnd: IntegerOrText? { get set }
    /// The page on which the work starts; for example "135" or "xiii".
    var pageStart: IntegerOrText? { get set }
    /// Any description of pages that is not separated into pageStart and pageEnd; for example, "1-6, 9, 55" or "10-12, 46-49".
    var pagination: String? { get set }
    /// The number of words in the text of the Article.
    var wordCount: Int? { get set }
}
