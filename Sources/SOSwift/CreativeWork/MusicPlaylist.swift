import Foundation

public class MusicPlaylist: CreativeWork {
    
    /// The number of tracks in this album or playlist.
    public var numTracks: Int?
    
    /// A music recording (track)—usually a single song. If an ItemList is given,
    /// the list should contain items of type MusicRecording. Supersedes tracks.
    /// - schema.org property name: track
    public var tracks: [ItemListOrMusicRecording]?
    
    internal enum MusicPlaylistCodingKeys: String, CodingKey {
        case numTracks
        case tracks
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: MusicPlaylistCodingKeys.self)
        
        numTracks = try container.decodeIfPresent(Int.self, forKey: .numTracks)
        tracks = try container.decodeIfPresent([ItemListOrMusicRecording].self, forKey: .tracks)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MusicPlaylistCodingKeys.self)
        
        try container.encodeIfPresent(numTracks, forKey: .numTracks)
        try container.encodeIfPresent(tracks, forKey: .tracks)
        
        try super.encode(to: encoder)
    }
}
