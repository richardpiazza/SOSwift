@testable import SOSwift
import XCTest

class DistanceOrQuantitativeValueTests: XCTestCase {

    fileprivate class TestClass: Codable, Schema {
        var distance: DistanceOrQuantitativeValue?
        var quantitativeValue: DistanceOrQuantitativeValue?
    }

    func testDecode() throws {
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

        let testObject = try TestClass.make(with: json)
        XCTAssertEqual(testObject.distance?.distance?.name, "A Distance")
        XCTAssertNil(testObject.distance?.quantitativeValue)
        XCTAssertEqual(testObject.quantitativeValue?.quantitativeValue?.name, "A Quantitative Value")
        XCTAssertNil(testObject.quantitativeValue?.distance)
        XCTAssertEqual(testObject.quantitativeValue?.quantitativeValue?.minValue?.floatingPoint, 1.5)
        XCTAssertNil(testObject.quantitativeValue?.quantitativeValue?.minValue?.integer)
        XCTAssertEqual(testObject.quantitativeValue?.quantitativeValue?.maxValue?.integer, 6)
        XCTAssertNil(testObject.quantitativeValue?.quantitativeValue?.maxValue?.floatingPoint)
    }

    func testEncode() throws {
        let testObject = TestClass()

        let distance = Distance()
        distance.name = "Kilometer"
        testObject.distance = .distance(value: distance)

        let quantitativeValue = QuantitativeValue()
        quantitativeValue.name = "Range"
        quantitativeValue.minValue = .floatingPoint(value: 0.0)
        quantitativeValue.maxValue = .floatingPoint(value: 1.0)
        testObject.quantitativeValue = .quantitativeValue(value: quantitativeValue)

        let dictionary = try testObject.asDictionary()

        guard let d = dictionary["distance"] as? [String: Any] else {
            XCTFail()
            return
        }

        guard let dName = d["name"] as? String else {
            XCTFail()
            return
        }

        XCTAssertEqual(dName, "Kilometer")

        guard let qv = dictionary["quantitativeValue"] as? [String: Any] else {
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
