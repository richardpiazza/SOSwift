@testable import SOSwift
import XCTest

class AccessibilityAPITests: XCTestCase {

    func testCaseIterable() throws {
        XCTAssertEqual(AccessibilityAPI.allCases.count, 11)
    }

    func testDisplayValue() throws {
        XCTAssertEqual(AccessibilityAPI.androidAccessibility.displayValue, "Android Accessibility")
        XCTAssertEqual(AccessibilityAPI.aria.displayValue, "Accessible Rich Internet Applications")
        XCTAssertEqual(AccessibilityAPI.atk.displayValue, "GNOME Accessibility Toolkit")
        XCTAssertEqual(AccessibilityAPI.atSPI.displayValue, "Assistive Technology Service Provider Interface")
        XCTAssertEqual(AccessibilityAPI.blackberryAccessibility.displayValue, "Blackberry Accessibility")
        XCTAssertEqual(AccessibilityAPI.iAccessible2.displayValue, "Microsoft Windows Accesibility")
        XCTAssertEqual(AccessibilityAPI.iOSAccessibility.displayValue, "iOS Accessibility")
        XCTAssertEqual(AccessibilityAPI.javaAccessibility.displayValue, "Java Accessibility")
        XCTAssertEqual(AccessibilityAPI.macOSXAccessibility.displayValue, "Mac OS Accessibiliy")
        XCTAssertEqual(AccessibilityAPI.msaa.displayValue, "Microsoft Active Accessibility")
        XCTAssertEqual(AccessibilityAPI.uiAutomation.displayValue, "UI Automation")
    }
}
