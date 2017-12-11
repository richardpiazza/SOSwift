import Foundation

public protocol MusicRecordingConformance:
                    ItemListOrMusicRecording
                {}

/// A music recording (track), usually a single song.
public protocol MusicRecording: CreativeWork, MusicRecordingConformance {
    /// The artist that performed this album or recording.
    var byArtist: MusicGroup? { get set }
    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    var duration: Duration? { get set }
    /// The album to which this recording belongs.
    var inAlbum: MusicAlbum? { get set }
    /// The playlist to which this recording belongs.
    var inPlaylist: MusicPlaylist? { get set }
    /// The International Standard Recording Code for the recording.
    var isrcCode: String? { get set }
    /// The composition this track is a recording of.
    /// - Inverse property: recordedAs.
    var recordingOf: MusicComposition? { get set }
}
