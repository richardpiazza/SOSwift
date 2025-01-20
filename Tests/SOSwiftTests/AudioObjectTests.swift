@testable import SOSwift
import XCTest

class AudioObjectTests: XCTestCase {

    public static let _transcript = "These are the most compelling words I can give."

    public static var audioObject: AudioObject {
        let audioObject = AudioObject()
        audioObject.transcript = _transcript
        return audioObject
    }

    func testSchema() throws {
        XCTAssertEqual(AudioObject.schemaName, "AudioObject")
    }

    func testDecode() throws {
        let json = """
        {
            "transcript": "Some Words Transcribed"
        }
        """

        let audioObject = try AudioObject.make(with: json)

        XCTAssertEqual(audioObject.transcript, "Some Words Transcribed")
    }

    func testEncode() throws {
        let dictionary = try AudioObjectTests.audioObject.asDictionary()

        let transcript = dictionary[AudioObject.AudioObjectCodingKeys.transcript.rawValue] as? String

        XCTAssertEqual(transcript, AudioObjectTests._transcript)
    }
}
