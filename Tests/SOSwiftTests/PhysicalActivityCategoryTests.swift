import XCTest
@testable import SOSwift

class PhysicalActivityCategoryTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(PhysicalActivityCategory.allCases.count, 7)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(PhysicalActivityCategory.aerobic.displayValue, "Aerobic Activity")
        XCTAssertEqual(PhysicalActivityCategory.anaerobic.displayValue, "Anaerobic Activity")
        XCTAssertEqual(PhysicalActivityCategory.balance.displayValue, "Balance")
        XCTAssertEqual(PhysicalActivityCategory.flexibility.displayValue, "Flexibility")
        XCTAssertEqual(PhysicalActivityCategory.leisureTime.displayValue, "Leisure Time")
        XCTAssertEqual(PhysicalActivityCategory.occupational.displayValue, "Occupational")
        XCTAssertEqual(PhysicalActivityCategory.strengthTraining.displayValue, "Strength Training")
    }
    
}
