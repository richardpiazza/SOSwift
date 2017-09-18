import Foundation

/// A news article.
public protocol NewsArticle: Article {
    /// The location where the NewsArticle was produced.
    var dateline: String? { get set }
    /// The number of the column in which the NewsArticle appears in the print edition.
    var printColumn: String? { get set }
    /// The edition of the print product in which the NewsArticle appears.
    var printEdition: String? { get set }
    /// If this NewsArticle appears in print, this field indicates the name of the page on which the article is found. Please note that this field is intended for the exact page name (e.g. A5, B18).
    var printPage: String? { get set }
    /// If this NewsArticle appears in print, this field indicates the print section in which the article appeared.
    var printSection: String? { get set }
}
