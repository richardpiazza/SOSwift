import Foundation

/// A collection of music tracks in playlist form.
public protocol MusicPlaylist: CreativeWork {
    /// The number of tracks in this album or playlist.
    var numTracks: Int? { get set }
    /// A music recording (track)—usually a single song. If an ItemList is given, the list should contain items of type MusicRecording. Supersedes tracks.
    /// - schema.org property name: track
    var tracks: [ItemListOrMusicRecording]? { get set }
}
