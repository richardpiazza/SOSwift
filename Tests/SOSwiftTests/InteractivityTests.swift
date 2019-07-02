import XCTest
@testable import SOSwift

class InteractivityTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(Interactivity.allCases.count, 3)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(Interactivity.active.displayValue, "Active")
        XCTAssertEqual(Interactivity.expositive.displayValue, "Expositive")
        XCTAssertEqual(Interactivity.mixed.displayValue, "Mixed")
    }
    
}
