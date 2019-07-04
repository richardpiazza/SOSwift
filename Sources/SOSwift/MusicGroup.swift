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
    
    internal enum MusicGroupCodingKeys: String, CodingKey {
        case album
        case genre
        case tracks = "track"
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: MusicGroupCodingKeys.self)
        
        album = try container.decodeIfPresent([MusicAlbum].self, forKey: .album)
        genre = try container.decodeIfPresent(URLOrText.self, forKey: .genre)
        tracks = try container.decodeIfPresent([ItemListOrMusicRecording].self, forKey: .tracks)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MusicGroupCodingKeys.self)
        
        try container.encodeIfPresent(album, forKey: .album)
        try container.encodeIfPresent(genre, forKey: .genre)
        try container.encodeIfPresent(tracks, forKey: .tracks)
        
        try super.encode(to: encoder)
    }
}
