import Foundation
import SOSwiftVocabulary

/// A news article.
public class SONewsArticle: SOArticle, NewsArticle {

    public override class var type: String {
        return "NewsArticle"
    }
    
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
    
    private enum CodingKeys: String, CodingKey {
        case dateline
        case printColumn
        case printEdition
        case printPage
        case printSection
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .dateline) {
            self.dateline = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .printColumn) {
            self.printColumn = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .printEdition) {
            self.printEdition = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .printPage) {
            self.printPage = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .printSection) {
            self.printSection = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.dateline {
            try container.encode(value, forKey: .dateline)
        }
        if let value = self.printColumn {
            try container.encode(value, forKey: .printColumn)
        }
        if let value = self.printEdition {
            try container.encode(value, forKey: .printEdition)
        }
        if let value = self.printPage {
            try container.encode(value, forKey: .printPage)
        }
        if let value = self.printSection {
            try container.encode(value, forKey: .printSection)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
