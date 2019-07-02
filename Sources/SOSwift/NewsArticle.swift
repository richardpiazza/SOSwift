import Foundation

/// A news article.
public class NewsArticle: Article {
    
    /// The location where the NewsArticle was produced.
    public var dateline: String?
    
    /// The number of the column in which the NewsArticle appears in the print edition.
    public var printColumn: String?
    
    /// The edition of the print product in which the NewsArticle appears.
    public var printEdition: String?
    
    /// If this NewsArticle appears in print, this field indicates the name of the page on which the article is found. Please note that this field is intended for the exact page name (e.g. A5, B18).
    public var printPage: String?
    
    /// If this NewsArticle appears in print, this field indicates the print section in which the article appeared.
    public var printSection: String?
    
    internal enum NewsArticleCodingKeys: String, CodingKey {
        case dateline
        case printColumn
        case printEdition
        case printPage
        case printSection
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: NewsArticleCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: NewsArticleCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
