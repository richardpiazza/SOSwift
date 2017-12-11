import Foundation

/// A MusicRelease is a specific release of a music album.
public protocol MusicRelease: MusicPlaylist {
    /// The catalog number for the release.
    var catalogNumber: String? { get set }
    /// The group the release is credited to if different than the byArtist. For example, Red and Blue is credited to "Stefani Germanotta Band", but by Lady Gaga.
    var creditedTo: OrganizationOrPerson? { get set }
    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    var duration: Duration? { get set }
    /// Format of this release (the type of recording media used, ie. compact disc, digital media, LP, etc.).
    var musicReleaseFormat: MusicReleaseFormat? { get set }
    /// The label that issued the release.
    var recordLabel: Organization? { get set }
    /// The album this is a release of.
    /// - Inverse property: albumRelease.
    var releaseOf: MusicAlbum? { get set }
}
