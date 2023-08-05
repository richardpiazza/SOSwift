import XCTest
@testable import SOSwift

class InteractivityTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(Interactivity.allCases.count, 3)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(Interactivity.active.displayValue, "Active")
        XCTAssertEqual(Interactivity.expositive.displayValue, "Expositive")
        XCTAssertEqual(Interactivity.mixed.displayValue, "Mixed")
    }
    
}
