import XCTest
@testable import SOSwift

#if canImport(ObjectiveC)
class DurationTests: XCTestCase {
    
    let fullDuration: Duration = Duration(stringValue: "P1Y5M3DT10H20M8S")
    let weekDuration: Duration = Duration(stringValue: "P24W")
    
    func testDecode() {
        let fullDateComponents = fullDuration.rawValue
        XCTAssertEqual(fullDateComponents.year, 1)
        XCTAssertEqual(fullDateComponents.month, 5)
        XCTAssertEqual(fullDateComponents.day, 3)
        XCTAssertEqual(fullDateComponents.hour, 10)
        XCTAssertEqual(fullDateComponents.minute, 20)
        XCTAssertEqual(fullDateComponents.second, 8)
        
        let weekDateComponents = weekDuration.rawValue
        XCTAssertEqual(weekDateComponents.weekOfYear, 24)
    }

    func testEncode() {
        var fullDateComponents = DateComponents()
        fullDateComponents.year = 3
        fullDateComponents.month = 4
        fullDateComponents.day = 5
        fullDateComponents.hour = 6
        fullDateComponents.minute = 7
        fullDateComponents.second = 8
        
        let fullDateDuration = Duration(rawValue: fullDateComponents).stringValue
        XCTAssertEqual(fullDateDuration, "P3Y4M5DT6H7M8S")
        
        var weekDateComponents = DateComponents()
        weekDateComponents.weekOfYear = 44
        
        let weekDateDuration = Duration(rawValue: weekDateComponents).stringValue
        XCTAssertEqual(weekDateDuration, "P44W")
    }
    
    func testEquatability() throws {
        let duration1 = Duration(stringValue: "P1Y6M")
        let duration2 = Duration(stringValue: "P1Y6M")
        let duration3 = Duration(stringValue: "P18W")
        
        XCTAssertEqual(duration1, duration2)
        XCTAssertNotEqual(duration1, duration3)
    }
}
#endif
