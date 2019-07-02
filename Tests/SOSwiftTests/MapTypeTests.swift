import XCTest
@testable import SOSwift

class MapTypeTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(MapType.allCases.count, 4)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(MapType.parking.displayValue, "Parking")
        XCTAssertEqual(MapType.seating.displayValue, "Seating")
        XCTAssertEqual(MapType.transit.displayValue, "Transit")
        XCTAssertEqual(MapType.venue.displayValue, "Venue")
    }
    
}
