@testable import SOSwift
import XCTest

class AccessibilityFeatureTests: XCTestCase {

    func testCaseIterable() throws {
        XCTAssertEqual(AccessibilityFeature.allCases.count, 31)
    }

    func testDisplayValue() throws {
        XCTAssertEqual(AccessibilityFeature.alternativeText.displayValue, "Alternative Text")
        XCTAssertEqual(AccessibilityFeature.annotations.displayValue, "Annotations")
        XCTAssertEqual(AccessibilityFeature.audioDescription.displayValue, "Audio Description")
        XCTAssertEqual(AccessibilityFeature.bookmarks.displayValue, "Bookmarks")
        XCTAssertEqual(AccessibilityFeature.braille.displayValue, "Braille")
        XCTAssertEqual(AccessibilityFeature.captions.displayValue, "Captions")
        XCTAssertEqual(AccessibilityFeature.chemML.displayValue, "Chemical Markup Language")
        XCTAssertEqual(AccessibilityFeature.describedMath.displayValue, "Described Math")
        XCTAssertEqual(AccessibilityFeature.displayTransformability.displayValue, "Display Transformability")
        XCTAssertEqual(AccessibilityFeature.highContrastAudio.displayValue, "High Contrast Audio")
        XCTAssertEqual(AccessibilityFeature.highContrastDisplay.displayValue, "High Contrast Display")
        XCTAssertEqual(AccessibilityFeature.index.displayValue, "Index")
        XCTAssertEqual(AccessibilityFeature.largePrint.displayValue, "Large Print")
        XCTAssertEqual(AccessibilityFeature.latex.displayValue, "Lamport TeX")
        XCTAssertEqual(AccessibilityFeature.longDescription.displayValue, "Long Description")
        XCTAssertEqual(AccessibilityFeature.mathML.displayValue, "Math Markup Language")
        XCTAssertEqual(AccessibilityFeature.none.displayValue, "None")
        XCTAssertEqual(AccessibilityFeature.printPageNumbers.displayValue, "Print Page Numbers")
        XCTAssertEqual(AccessibilityFeature.readingOrder.displayValue, "Reading Order")
        XCTAssertEqual(AccessibilityFeature.rubyAnnotations.displayValue, "Ruby Annotations")
        XCTAssertEqual(AccessibilityFeature.signLanguage.displayValue, "Sign Language")
        XCTAssertEqual(AccessibilityFeature.structuralNavigation.displayValue, "Structural Navigation")
        XCTAssertEqual(AccessibilityFeature.synchronizedAudioText.displayValue, "Synchronized Audio Text")
        XCTAssertEqual(AccessibilityFeature.tableOfContents.displayValue, "Table Of Contents")
        XCTAssertEqual(AccessibilityFeature.taggedPDF.displayValue, "Tagged PDF")
        XCTAssertEqual(AccessibilityFeature.tactileGraphic.displayValue, "Tactile Graphic")
        XCTAssertEqual(AccessibilityFeature.tactileObject.displayValue, "Tactile Object")
        XCTAssertEqual(AccessibilityFeature.timingControl.displayValue, "Timing Control")
        XCTAssertEqual(AccessibilityFeature.transcript.displayValue, "Transcript")
        XCTAssertEqual(AccessibilityFeature.ttsMarkup.displayValue, "TTS Markup")
        XCTAssertEqual(AccessibilityFeature.unlocked.displayValue, "Unlocked")
    }
}
