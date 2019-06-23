import Foundation

/// A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.
public class MusicGroup: PerformingGroup {
    
    /// A music album.
    public var album: [MusicAlbum]?
    
    /// Genre of the creative work, broadcast channel or group.
    public var genre: URLOrText?
    
    /// A music recording (track) - usually a single song. If an ItemList is given,
    /// the list should contain items of type MusicRecording.
    public var tracks: [ItemListOrMusicRecording]?
    
    private enum CodingKeys: String, CodingKey {
        case album
        case genre
        case tracks = "track"
    }
    
}
