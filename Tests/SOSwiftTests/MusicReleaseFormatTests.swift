@testable import SOSwift
import XCTest

class MusicReleaseFormatTests: XCTestCase {

    func testCaseIterable() throws {
        XCTAssertEqual(MusicReleaseFormat.allCases.count, 7)
    }

    func testDisplayValue() throws {
        XCTAssertEqual(MusicReleaseFormat.cd.displayValue, "CD")
        XCTAssertEqual(MusicReleaseFormat.cassette.displayValue, "Cassette")
        XCTAssertEqual(MusicReleaseFormat.dvd.displayValue, "DVD")
        XCTAssertEqual(MusicReleaseFormat.digitalAudioTape.displayValue, "Digital Tape")
        XCTAssertEqual(MusicReleaseFormat.digital.displayValue, "Digital")
        XCTAssertEqual(MusicReleaseFormat.laserDisc.displayValue, "Laser Disc")
        XCTAssertEqual(MusicReleaseFormat.vinyl.displayValue, "Vinyl")
    }
}
