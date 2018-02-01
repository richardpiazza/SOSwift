import Foundation
import SOSwiftVocabulary_ObjC

/// A collection of music tracks.
public class SOMusicAlbum: SOMusicPlaylist, MusicAlbum {
    
    public override class var type: String {
        return "MusicAlbum"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// Classification of the album by it's type of content: soundtrack, live album, studio album, etc.
    public var albumProductionTypeRawType: NSNumber?
    /// A release of this album.
    /// - Inverse property: releaseOf.
    public var albumRelease: MusicRelease?
    /// The kind of release which this album is: single, EP or album.
    public var albumReleaseTypeRawValue: NSNumber?
    /// The artist that performed this album or recording.
    public var byArtist: MusicGroup?
    
    private enum CodingKeys: String, CodingKey {
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
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .albumProductionType) {
            self.albumProductionType = MusicAlbumProduction(stringValue: rawValue)
        }
        self.albumRelease = try container.decodeIfPresent(SOMusicRelease.self, forKey: .albumRelease)
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .albumReleaseType) {
            self.albumReleaseType = MusicAlbumRelease(stringValue: rawValue)
        }
        self.byArtist = try container.decodeIfPresent(SOMusicGroup.self, forKey: .byArtist)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.albumProductionType?.stringValue, forKey: .albumProductionType)
        try container.encodeIfPresent(self.albumRelease, forKey: .albumRelease)
        try container.encodeIfPresent(self.albumReleaseType?.stringValue, forKey: .albumReleaseType)
        try container.encodeIfPresent(self.byArtist, forKey: .byArtist)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MusicAlbum?, forKey key: K) throws {
        if let typedValue = value as? SOMusicAlbum {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [MusicAlbum]?, forKey key: K) throws {
        if let typedValue = value as? [SOMusicAlbum] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
