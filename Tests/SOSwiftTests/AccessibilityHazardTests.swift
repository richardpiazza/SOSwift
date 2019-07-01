import XCTest
@testable import SOSwift

class AccessibilityHazardTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(AccessibilityHazard.allCases.count, 7)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(AccessibilityHazard.flashing.displayValue, "Flashing")
        XCTAssertEqual(AccessibilityHazard.noFlashingHazard.displayValue, "No Flashing Hazard")
        XCTAssertEqual(AccessibilityHazard.motionSimulation.displayValue, "Motion Simulation")
        XCTAssertEqual(AccessibilityHazard.noMotionSimulation.displayValue, "No Motion Simulation")
        XCTAssertEqual(AccessibilityHazard.sound.displayValue, "Sound")
        XCTAssertEqual(AccessibilityHazard.noSoundHazard.displayValue, "No Sound Hazard")
        XCTAssertEqual(AccessibilityHazard.unknown.displayValue, "Unknown")
    }
    
}
