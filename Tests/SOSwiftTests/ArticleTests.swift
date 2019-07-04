import XCTest
@testable import SOSwift

class ArticleTests: XCTestCase {
    
    static var allTests = [
        ("testSchema", testSchema),
        ("testDecode", testDecode),
        ("testEncode", testEncode),
    ]
    
    public static let _articleBody = "This is the article body"
    public static let _articleSection = "Lifestyle"
    public static let _pageEnd = 138
    public static let _pageStart = 135
    public static let _pagination = "135-138"
    public static let _wordCount = 1234
    
    public static var article: Article {
        let article = Article()
        article.articleBody = _articleBody
        article.articleSection = _articleSection
        article.pageEnd = IntegerOrText(_pageEnd)
        article.pageStart = IntegerOrText(_pageStart)
        article.pagination = _pagination
        article.wordCount = _wordCount
        return article
    }
    
    func testSchema() throws {
        XCTAssertEqual(Article.schemaType, "Article")
    }
    
    func testDecode() throws {
        let json = """
        {
            "articleBody": "Headline",
            "articleSection": "Front Page",
            "pageEnd": 1,
            "pageStart": 1,
            "pagination": "1-1",
            "wordCount": 50
        }
        """
        
        let article = try Article.make(with: json)
        
        XCTAssertEqual(article.articleBody, "Headline")
        XCTAssertEqual(article.articleSection, "Front Page")
        XCTAssertEqual(article.pageEnd?.integer, 1)
        XCTAssertEqual(article.pageStart?.integer, 1)
        XCTAssertEqual(article.pagination, "1-1")
        XCTAssertEqual(article.wordCount, 50)
    }
    
    func testEncode() throws {
        let dictionary = try ArticleTests.article.asDictionary()
        
        let articleBody = dictionary[Article.ArticleCodingKeys.articleBody.rawValue] as? String
        let articleSection = dictionary[Article.ArticleCodingKeys.articleSection.rawValue] as? String
        let pageEnd = dictionary[Article.ArticleCodingKeys.pageEnd.rawValue] as? Int
        let pageStart = dictionary[Article.ArticleCodingKeys.pageStart.rawValue] as? Int
        let pagination = dictionary[Article.ArticleCodingKeys.pagination.rawValue] as? String
        let wordCount = dictionary[Article.ArticleCodingKeys.wordCount.rawValue] as? Int
        
        XCTAssertEqual(articleBody, ArticleTests._articleBody)
        XCTAssertEqual(articleSection, ArticleTests._articleSection)
        XCTAssertEqual(pageEnd, ArticleTests._pageEnd)
        XCTAssertEqual(pageStart, ArticleTests._pageStart)
        XCTAssertEqual(pagination, ArticleTests._pagination)
        XCTAssertEqual(wordCount, ArticleTests._wordCount)
    }
    
}
