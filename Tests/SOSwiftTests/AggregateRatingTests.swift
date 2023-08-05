import XCTest
@testable import SOSwift

class AggregateRatingTests: XCTestCase {
        public static let _ratingCount = 4000
    public static let _reviewCount = 1500
    
    public static var aggregateRating: AggregateRating {
        let aggregateRating = AggregateRating()
        aggregateRating.itemReviewed = ThingTests.thing
        aggregateRating.ratingCount = _ratingCount
        aggregateRating.reviewCount = _reviewCount
        return aggregateRating
    }
    
    func testSchema() throws {
        XCTAssertEqual(AggregateRating.schemaName, "AggregateRating")
    }
    
    func testDecode() throws {
        let json = """
        {
            "itemReviewed": {
                "@type": "Thing",
                "name": "Stereo"
            },
            "ratingCount": 40,
            "reviewCount": 50502
        }
        """
        
        let aggregateRating = try AggregateRating.make(with: json)
        XCTAssertEqual(aggregateRating.itemReviewed?.name, "Stereo")
        XCTAssertEqual(aggregateRating.ratingCount, 40)
        XCTAssertEqual(aggregateRating.reviewCount, 50502)
    }
    
    func testEncode() throws {
        let dictionary = try AggregateRatingTests.aggregateRating.asDictionary()
        
        let itemReviewed = dictionary[AggregateRating.AggregateRatingCodingKeys.itemReviewed.rawValue] as? [String : Any]
        let ratingCount = dictionary[AggregateRating.AggregateRatingCodingKeys.ratingCount.rawValue] as? Int
        let reviewCount = dictionary[AggregateRating.AggregateRatingCodingKeys.reviewCount.rawValue] as? Int
        
        XCTAssertEqual(itemReviewed?["name"] as? String, ThingTests.thing.name)
        XCTAssertEqual(ratingCount, AggregateRatingTests._ratingCount)
        XCTAssertEqual(reviewCount, AggregateRatingTests._reviewCount)
    }
    
}
