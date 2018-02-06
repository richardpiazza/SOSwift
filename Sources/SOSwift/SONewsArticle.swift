import Foundation
import SOSwiftVocabulary

/// A news article.
public class SONewsArticle: SOArticle, NewsArticle {

    public override class var type: String {
        return "NewsArticle"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.dateline = try container.decodeIfPresent(String.self, forKey: .dateline)
        self.printColumn = try container.decodeIfPresent(String.self, forKey: .printColumn)
        self.printEdition = try container.decodeIfPresent(String.self, forKey: .printEdition)
        self.printPage = try container.decodeIfPresent(String.self, forKey: .printPage)
        self.printSection = try container.decodeIfPresent(String.self, forKey: .printSection)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.dateline, forKey: .dateline)
        try container.encodeIfPresent(self.printColumn, forKey: .printColumn)
        try container.encodeIfPresent(self.printEdition, forKey: .printEdition)
        try container.encodeIfPresent(self.printPage, forKey: .printPage)
        try container.encodeIfPresent(self.printSection, forKey: .printSection)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.dateline.rawValue:
            return "The location where the NewsArticle was produced."
        case CodingKeys.printColumn.rawValue:
            return "The number of the column in which the NewsArticle appears in the print edition."
        case CodingKeys.printEdition.rawValue:
            return "The edition of the print product in which the NewsArticle appears."
        case CodingKeys.printPage.rawValue:
            return "If this NewsArticle appears in print, this field indicates the name of the page on which the article is found."
        case CodingKeys.printSection.rawValue:
            return "If this NewsArticle appears in print, this field indicates the print section in which the article appeared."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.dateline.rawValue:
            self.dateline = value as? String
        case CodingKeys.printColumn.rawValue:
            self.printColumn = value as? String
        case CodingKeys.printEdition.rawValue:
            self.printEdition = value as? String
        case CodingKeys.printPage.rawValue:
            self.printPage = value as? String
        case CodingKeys.printSection.rawValue:
            self.printSection = value as? String
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: NewsArticle?, forKey key: K) throws {
        if let typedValue = value as? SONewsArticle {
            try self.encode(typedValue, forKey: key)
        }
    }
}
