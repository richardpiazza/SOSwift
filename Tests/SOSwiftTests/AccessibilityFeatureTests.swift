import XCTest
@testable import SOSwift

class AccessibilityFeatureTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(AccessibilityFeature.allCases.count, 31)
    }
    
    func testDisplayValue() throws {
        
    }
    
}
