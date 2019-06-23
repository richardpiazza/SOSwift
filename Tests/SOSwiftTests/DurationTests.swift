import XCTest
@testable import SOSwift

class DurationTests: XCTestCase {

    let fullDuration: Duration = Duration(rawValue: "P1Y5M3DT10H20M8S")!
    let weekDuration: Duration = Duration(rawValue: "P24W")!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDurationToDateComponents() {
        let fullDateComponents = fullDuration.dateComponents
        XCTAssertEqual(fullDateComponents.year, 1)
        XCTAssertEqual(fullDateComponents.month, 5)
        XCTAssertEqual(fullDateComponents.day, 3)
        XCTAssertEqual(fullDateComponents.hour, 10)
        XCTAssertEqual(fullDateComponents.minute, 20)
        XCTAssertEqual(fullDateComponents.second, 8)
        
        let weekDateComponents = weekDuration.dateComponents
        XCTAssertEqual(weekDateComponents.weekOfYear, 24)
    }

    func testDateComponentsToDuration() {
        var fullDateComponents = DateComponents()
        fullDateComponents.year = 3
        fullDateComponents.month = 4
        fullDateComponents.day = 5
        fullDateComponents.hour = 6
        fullDateComponents.minute = 7
        fullDateComponents.second = 8
        
        let fullDateDuration = Duration(dateComponents: fullDateComponents).rawValue
        XCTAssertEqual(fullDateDuration, "P3Y4M5DT6H7M8S")
        
        var weekDateComponents = DateComponents()
        weekDateComponents.weekOfYear = 44
        
        let weekDateDuration = Duration(dateComponents: weekDateComponents).rawValue
        XCTAssertEqual(weekDateDuration, "P44W")
    }
}
