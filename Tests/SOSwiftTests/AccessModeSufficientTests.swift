import XCTest
@testable import SOSwift

class AccessModeSufficientTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(AccessModeSufficient.allCases.count, 4)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(AccessModeSufficient.auditory.displayValue, "Auditory")
        XCTAssertEqual(AccessModeSufficient.tactile.displayValue, "Tactile")
        XCTAssertEqual(AccessModeSufficient.textual.displayValue, "Textual")
        XCTAssertEqual(AccessModeSufficient.visual.displayValue, "Visual")
    }
    
}
