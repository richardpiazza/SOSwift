import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class DistanceOrQuantitativeValueTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var distance: DistanceOrQuantitativeValue?
        var quantitativeValue: DistanceOrQuantitativeValue?
        
        private enum CodingKeys: String, CodingKey {
            case distance
            case quantitativeValue
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.distance = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .distance)
            self.quantitativeValue = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .quantitativeValue)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.distance, forKey: .distance)
            try container.encodeIfPresent(self.quantitativeValue, forKey: .quantitativeValue)
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
                "distance" : {
                    "@type" : "Distance",
                    "name" : "A Distance"
                },
                "quantitativeValue" : {
                    "@type" : "QuantitativeValue",
                    "name" : "A Quantitative Value",
                    "maxValue" : 6,
                    "minValue" : 1.5
                }
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let distance = testObject.distance as? Distance else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(distance.name, "A Distance")
        
        guard let quantitativeValue = testObject.quantitativeValue as? QuantitativeValue else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(quantitativeValue.name, "A Quantitative Value")
        
        guard let maxValue = quantitativeValue.maxValue as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(maxValue, 6)
        
        guard let minValue = quantitativeValue.minValue as? Double else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(minValue, 1.5)
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let distance = SODistance()
        distance.name = "Kilometer"
        testObject.distance = distance
        
        let quantitativeValue = SOQuantitativeValue()
        quantitativeValue.name = "Range"
        quantitativeValue.minValue = 0.0
        quantitativeValue.maxValue = 1.0
        testObject.quantitativeValue = quantitativeValue
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let d = dictionary["distance"] as? [String : Any] else {
            XCTFail()
            return
        }
        
        guard let dName = d["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(dName, "Kilometer")
        
        guard let qv = dictionary["quantitativeValue"] as? [String : Any] else {
            XCTFail()
            return
        }
        
        guard let qvName = qv["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(qvName, "Range")
        
        guard let qvMin = qv["minValue"] as? Double else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(qvMin, 0.0)
        
        guard let qvMax = qv["maxValue"] as? Double else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(qvMax, 1.0)
    }
}
