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
    
}
