import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class DistanceOrQuantitativeValueTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var distance: DistanceOrQuantitativeValue?
        var quantitativeValue: DistanceOrQuantitativeValue?
        var multiple: [DistanceOrQuantitativeValue]?
        
        private enum CodingKeys: String, CodingKey {
            case distance
            case quantitativeValue
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.distance = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .distance)
            self.quantitativeValue = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .quantitativeValue)
            self.multiple = try container.decodeDistancesOrQuantitativeValuesIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.distance, forKey: .distance)
            try container.encodeIfPresent(self.quantitativeValue, forKey: .quantitativeValue)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
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
        
        guard let distance = testObject.distance as? SODistanceOrQuantitativeValue else {
            XCTFail()
            return
        }
        
        switch distance {
        case .distance(let value):
            XCTAssertEqual(value.name, "A Distance")
        default:
            XCTFail()
        }
        
        guard let quantitativeValue = testObject.quantitativeValue as? SODistanceOrQuantitativeValue else {
            XCTFail()
            return
        }
        
        switch quantitativeValue {
        case .quantitativeValue(let value):
            XCTAssertEqual(value.name, "A Quantitative Value")
            XCTAssertEqual(value.maxValue as? Int, 6)
            XCTAssertEqual(value.minValue as? Double, 1.5)
        default:
            XCTFail()
        }
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
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type" : "Distance",
                    "name" : "A Distance"
                },
                {
                    "@type" : "QuantitativeValue",
                    "name" : "A Quantitative Value",
                    "maxValue" : 6,
                    "minValue" : 1.5
                }
            ]
        }
        """
        
        let testObject = try TestClass.make(with: json)
        
        guard let multiple = testObject.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 2)
        
        guard let distance = (multiple[0] as? SODistanceOrQuantitativeValue)?.distance else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(distance.name, "A Distance")
        
        guard let quantitativeValue = (multiple[1] as? SODistanceOrQuantitativeValue)?.quantitativeValue else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(quantitativeValue.name, "A Quantitative Value")
        XCTAssertEqual(quantitativeValue.maxValue as? Int, 6)
        XCTAssertEqual(quantitativeValue.minValue as? Double, 1.5)
    }
    
    func testMultipleEncodes() throws {
        let distance = SODistance()
        distance.name = "Mile"
        
        let quantitativeValue = SOQuantitativeValue()
        quantitativeValue.name = "Lumens"
        quantitativeValue.minValue = 0.0
        quantitativeValue.maxValue = 4000
        
        var multiple: [SODistanceOrQuantitativeValue] = []
        multiple.append(.distance(value: distance))
        multiple.append(.quantitativeValue(value: quantitativeValue))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.dictionary()
        XCTAssertEqual(dictionary.keys.count, 1)
        
        guard let values = dictionary["multiple"] as? [[String : Any]] else {
            XCTFail()
            return
        }
        
        let d = values[0]
        let qv = values[1]
        
        XCTAssertEqual(d["name"] as? String, "Mile")
        XCTAssertEqual(qv["name"] as? String, "Lumens")
        XCTAssertEqual(qv["minValue"] as? Double, 0.0)
        XCTAssertEqual(qv["maxValue"] as? Int, 4000)
    }
}
