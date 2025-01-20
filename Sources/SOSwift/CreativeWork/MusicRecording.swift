import Foundation

/// A music recording (track), usually a single song.
public class MusicRecording: CreativeWork {

    /// The artist that performed this album or recording.
    public var byArtist: MusicGroup?

    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    public var duration: Duration?

    /// The album to which this recording belongs.
    public var inAlbum: MusicAlbum?

    /// The playlist to which this recording belongs.
    public var inPlaylist: MusicPlaylist?

    /// The International Standard Recording Code for the recording.
    public var isrcCode: String?

    /// The composition this track is a recording of.
    /// - Inverse property: recordedAs.
    public var recordingOf: MusicComposition?

    enum MusicRecordingCodingKeys: String, CodingKey {
        case byArtist
        case duration
        case inAlbum
        case inPlaylist
        case isrcCode
        case recordingOf
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: MusicRecordingCodingKeys.self)

        byArtist = try container.decodeIfPresent(MusicGroup.self, forKey: .byArtist)
        duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        inAlbum = try container.decodeIfPresent(MusicAlbum.self, forKey: .inAlbum)
        inPlaylist = try container.decodeIfPresent(MusicPlaylist.self, forKey: .inPlaylist)
        isrcCode = try container.decodeIfPresent(String.self, forKey: .isrcCode)
        recordingOf = try container.decodeIfPresent(MusicComposition.self, forKey: .recordingOf)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MusicRecordingCodingKeys.self)

        try container.encodeIfPresent(byArtist, forKey: .byArtist)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(inAlbum, forKey: .inAlbum)
        try container.encodeIfPresent(inPlaylist, forKey: .inPlaylist)
        try container.encodeIfPresent(isrcCode, forKey: .isrcCode)
        try container.encodeIfPresent(recordingOf, forKey: .recordingOf)

        try super.encode(to: encoder)
    }
}
