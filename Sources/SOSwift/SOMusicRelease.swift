import Foundation
import SOSwiftVocabulary

/// A MusicRelease is a specific release of a music album.
public class SOMusicRelease: SOMusicPlaylist, MusicRelease {
    
    public override class var type: String {
        return "MusicRelease"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return []
    }
    
    /// The catalog number for the release.
    public var catalogNumber: String?
    /// The group the release is credited to if different than the byArtist. For example, Red and Blue is credited to "Stefani Germanotta Band", but by Lady Gaga.
    public var creditedTo: OrganizationOrPerson?
    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    public var duration: Duration?
    /// Format of this release (the type of recording media used, ie. compact disc, digital media, LP, etc.).
    public var musicReleaseFormat: MusicReleaseFormat?
    /// The label that issued the release.
    public var recordLabel: Organization?
    /// The album this is a release of.
    /// - Inverse property: albumRelease.
    public var releaseOf: MusicAlbum?
    
    private enum CodingKeys: String, CodingKey {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.catalogNumber = try container.decodeIfPresent(String.self, forKey: .catalogNumber)
        self.creditedTo = try container.decodeOrganizationOrPersonIfPresent(forKey: .creditedTo)
        self.duration = try container.decodeDurationIfPresent(forKey: .duration)
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .musicReleaseFormat) {
            self.musicReleaseFormat = MusicReleaseFormat(rawValue: rawValue)
        }
        self.recordLabel = try container.decodeIfPresent(SOOrganization.self, forKey: .recordLabel)
        self.releaseOf = try container.decodeIfPresent(SOMusicAlbum.self, forKey: .releaseOf)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.catalogNumber, forKey: .catalogNumber)
        try container.encodeIfPresent(self.creditedTo, forKey: .creditedTo)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.musicReleaseFormat?.rawValue, forKey: .musicReleaseFormat)
        try container.encodeIfPresent(self.recordLabel, forKey: .recordLabel)
        try container.encodeIfPresent(self.releaseOf, forKey: .releaseOf)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MusicRelease?, forKey key: K) throws {
        if let typedValue = value as? SOMusicRelease {
            try self.encode(typedValue, forKey: key)
        }
    }
}

