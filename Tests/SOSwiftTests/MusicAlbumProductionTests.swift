import XCTest
@testable import SOSwift

class MusicAlbumProductionTests: XCTestCase {
    
    static var allTests = [
        ("testCaseIterable", testCaseIterable),
        ("testDisplayValue", testDisplayValue),
    ]
    
    func testCaseIterable() throws {
        XCTAssertEqual(MusicAlbumProduction.allCases.count, 9)
    }
    
    func testDisplayValue() throws {
        XCTAssertEqual(MusicAlbumProduction.compilation.displayValue, "Compilation")
        XCTAssertEqual(MusicAlbumProduction.djMix.displayValue, "DJ Mix")
        XCTAssertEqual(MusicAlbumProduction.demo.displayValue, "Demo")
        XCTAssertEqual(MusicAlbumProduction.live.displayValue, "Live")
        XCTAssertEqual(MusicAlbumProduction.mixtape.displayValue, "Mixtape")
        XCTAssertEqual(MusicAlbumProduction.remix.displayValue, "Remix")
        XCTAssertEqual(MusicAlbumProduction.soundtrack.displayValue, "Soundtrack")
        XCTAssertEqual(MusicAlbumProduction.spokenWord.displayValue, "Spoken Word")
        XCTAssertEqual(MusicAlbumProduction.studio.displayValue, "Studio")
    }
    
}
