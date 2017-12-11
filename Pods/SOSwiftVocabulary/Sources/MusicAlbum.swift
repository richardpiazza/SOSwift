import Foundation

/// A collection of music tracks.
public protocol MusicAlbum: MusicPlaylist {
    /// Classification of the album by it's type of content: soundtrack, live album, studio album, etc.
    var albumProductionType: MusicAlbumProduction? { get set }
    /// A release of this album.
    /// - Inverse property: releaseOf.
    var albumRelease: MusicRelease? { get set }
    /// The kind of release which this album is: single, EP or album.
    var albumReleaseType: MusicAlbumRelease? { get set }
    /// The artist that performed this album or recording.
    var byArtist: MusicGroup? { get set }
}
