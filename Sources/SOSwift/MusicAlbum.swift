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
    
}
