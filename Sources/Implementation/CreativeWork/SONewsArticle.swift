import Foundation

/// A news article.
public class SONewsArticle: SOArticle, NewsArticle {
    public struct Keys {
        public static let dateline = "dateline"
        public static let printColumn = "printColumn"
        public static let printEdition = "printEdition"
        public static let printPage = "printPage"
        public static let printSection = "printSection"
    }
    
    override public class var type: String {
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.dateline] as? String {
            self.dateline = value
        }
        if let value = dictionary[Keys.printColumn] as? String {
            self.printColumn = value
        }
        if let value = dictionary[Keys.printEdition] as? String {
            self.printEdition = value
        }
        if let value = dictionary[Keys.printPage] as? String {
            self.printPage = value
        }
        if let value = dictionary[Keys.printSection] as? String {
            self.printSection = value
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.dateline {
            dictionary[Keys.dateline] = value as AnyObject
        }
        if let value = self.printColumn {
            dictionary[Keys.printColumn] = value as AnyObject
        }
        if let value = self.printEdition {
            dictionary[Keys.printEdition] = value as AnyObject
        }
        if let value = self.printPage {
            dictionary[Keys.printPage] = value as AnyObject
        }
        if let value = self.printSection {
            dictionary[Keys.printSection] = value as AnyObject
        }
        return dictionary
    }
}
