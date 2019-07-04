import Foundation

/// A MusicRelease is a specific release of a music album.
public class MusicRelease: MusicPlaylist {
    
    /// The catalog number for the release.
    public var catalogNumber: String?
    
    /// The group the release is credited to if different than the byArtist.
    /// For example, Red and Blue is credited to "Stefani Germanotta Band",
    /// but by Lady Gaga.
    public var creditedTo: OrganizationOrPerson?
    
    /// The duration of the item (movie, audio recording, event, etc.) in
    /// ISO 8601 date format.
    public var duration: Duration?
    
    /// Format of this release (the type of recording media used, ie.
    /// compact disc, digital media, LP, etc.).
    public var musicReleaseFormat: MusicReleaseFormat?
    
    /// The label that issued the release.
    public var recordLabel: Organization?
    
    /// The album this is a release of.
    /// - Inverse property: albumRelease.
    public var releaseOf: MusicAlbum?
    
    internal enum MusicReleaseCodingKeys: String, CodingKey {
        case catalogNumber
        case creditedTo
        case duration
        case musicReleaseFormat
        case recordLabel
        case releaseOf
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: MusicReleaseCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MusicReleaseCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}