@testable import SOSwift
import XCTest

class AccessModeSufficientTests: XCTestCase {

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
