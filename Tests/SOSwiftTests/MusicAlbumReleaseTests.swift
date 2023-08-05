import XCTest
@testable import SOSwift

class MusicAlbumReleaseTests: XCTestCase {
    
    func testCaseIterable() throws {
        XCTAssertEqual(MusicAlbumRelease.allCases.count, 4)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(MusicAlbumRelease.album.displayValue, "Album")
        XCTAssertEqual(MusicAlbumRelease.broadcast.displayValue, "Broadcast")
        XCTAssertEqual(MusicAlbumRelease.ep.displayValue, "EP")
        XCTAssertEqual(MusicAlbumRelease.single.displayValue, "Single")
    }
    
}
