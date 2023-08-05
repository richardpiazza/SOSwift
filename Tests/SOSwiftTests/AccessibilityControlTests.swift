import XCTest
@testable import SOSwift

class AccessibilityControlTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(AccessibilityControl.allCases.count, 6)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(AccessibilityControl.fullKeyboardControl.displayValue, "Full Keyboard Control")
        XCTAssertEqual(AccessibilityControl.fullMouseControl.displayValue, "Full Mouse Control")
        XCTAssertEqual(AccessibilityControl.fullSwitchControl.displayValue, "Full Switch Control")
        XCTAssertEqual(AccessibilityControl.fullTouchControl.displayValue, "Full Touch Control")
        XCTAssertEqual(AccessibilityControl.fullVideoControl.displayValue, "Full Video Control")
        XCTAssertEqual(AccessibilityControl.fullVoiceControl.displayValue, "Full Voice Control")
    }
    
}
