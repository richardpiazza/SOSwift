import Foundation

public class MusicPlaylist: CreativeWork {
    
    /// The number of tracks in this album or playlist.
    public var numTracks: Int?
    
    /// A music recording (track)—usually a single song. If an ItemList is given,
    /// the list should contain items of type MusicRecording. Supersedes tracks.
    /// - schema.org property name: track
    public var tracks: [ItemListOrMusicRecording]?
    
}
