import Foundation

public class MusicAlbum: MusicPlaylist {
    
    /// Classification of the album by it's type of content: soundtrack, live album, studio album, etc.
    public var albumProductionType: MusicAlbumProduction?
    
    /// A release of this album.
    /// - Inverse property: releaseOf.
    public var albumRelease: MusicRelease?
    
    /// The kind of release which this album is: single, EP or album.
    public var albumReleaseType: MusicAlbumRelease?
    
    /// The artist that performed this album or recording.
    public var byArtist: MusicGroup?
    
    internal enum MusicAlbumCodingKeys: String, CodingKey {
        case albumProductionType
        case albumRelease
        case albumReleaseType
        case byArtist
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: MusicAlbumCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MusicAlbumCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
