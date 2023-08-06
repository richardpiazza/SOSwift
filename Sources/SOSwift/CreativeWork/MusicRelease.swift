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
        
        catalogNumber = try container.decodeIfPresent(String.self, forKey: .catalogNumber)
        creditedTo = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .creditedTo)
        duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        musicReleaseFormat = try container.decodeIfPresent(MusicReleaseFormat.self, forKey: .musicReleaseFormat)
        recordLabel = try container.decodeIfPresent(Organization.self, forKey: .recordLabel)
        releaseOf = try container.decodeIfPresent(MusicAlbum.self, forKey: .releaseOf)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MusicReleaseCodingKeys.self)
        
        try container.encodeIfPresent(catalogNumber, forKey: .catalogNumber)
        try container.encodeIfPresent(creditedTo, forKey: .creditedTo)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(musicReleaseFormat, forKey: .musicReleaseFormat)
        try container.encodeIfPresent(recordLabel, forKey: .recordLabel)
        try container.encodeIfPresent(releaseOf, forKey: .releaseOf)
        
        try super.encode(to: encoder)
    }
}
