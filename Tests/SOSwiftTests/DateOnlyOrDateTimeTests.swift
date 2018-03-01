import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class DateOnlyOrDateTimeTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var dateOnly: DateOnlyOrDateTime?
        var dateTime: DateOnlyOrDateTime?
        
        private enum CodingKeys: String, CodingKey {
            case dateOnly
            case dateTime
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.dateOnly = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateOnly)
            self.dateTime = try container.decodeDateOnlyOrDateTimeIfPresent(forKey: .dateTime)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(dateOnly, forKey: CodingKeys.dateOnly)
            try container.encodeIfPresent(dateTime, forKey: CodingKeys.dateTime)
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSingleDecodes() {
        let json = """
            {
                "dateOnly" : "2017-10-26",
                "dateTime" : "2017-10-26T07:58:00+6000"
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let dateOnly = testObject.dateOnly as? DateOnly else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(dateOnly.date)
        
        guard let dateTime = testObject.dateTime as? DateTime else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(dateTime.date)
    }

}
