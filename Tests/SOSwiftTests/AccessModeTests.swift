import XCTest
@testable import SOSwift

class AccessModeTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(AccessMode.allCases.count, 11)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(AccessMode.auditory.displayValue, "Auditory")
        XCTAssertEqual(AccessMode.tactile.displayValue, "Tactile")
        XCTAssertEqual(AccessMode.textual.displayValue, "Textual")
        XCTAssertEqual(AccessMode.visual.displayValue, "Visual")
        XCTAssertEqual(AccessMode.colorDependent.displayValue, "Color Dependent")
        XCTAssertEqual(AccessMode.chartOnVisual.displayValue, "Chart-On-Visual")
        XCTAssertEqual(AccessMode.chemOnVisual.displayValue, "Chemical-On-Visual")
        XCTAssertEqual(AccessMode.diagramOnVisual.displayValue, "Diagram-On-Visual")
        XCTAssertEqual(AccessMode.mathOnVisual.displayValue, "Math-On-Visual")
        XCTAssertEqual(AccessMode.musicOnVisual.displayValue, "Music-On-Visual")
        XCTAssertEqual(AccessMode.textOnVisual.displayValue, "Text-On-Visual")
    }
    
}
