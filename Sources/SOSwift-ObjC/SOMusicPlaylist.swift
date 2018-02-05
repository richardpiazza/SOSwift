import Foundation
import SOSwiftVocabulary_ObjC

public class SOMusicPlaylist: SOCreativeWork, MusicPlaylist {
    
    public override class var type: String {
        return "MusicPlaylist"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOMusicAlbum.self,
            SOMusicRelease.self
        ]
    }
    
    /// The number of tracks in this album or playlist.
    public var numTracksRawValue: NSNumber?
    /// A music recording (track)—usually a single song. If an ItemList is given, the list should contain items of type MusicRecording. Supersedes tracks.
    /// - schema.org property name: track
    public var tracks: [ItemListOrMusicRecording]?
    
    private enum CodingKeys: String, CodingKey {
        case numTracks
        case tracks
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.numTracks = try container.decodeIfPresent(Int.self, forKey: .numTracks)
        self.tracks = try container.decodeItemListsOrMusicRecordingsIfPresent(forKey: .tracks)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.numTracks, forKey: .numTracks)
        try container.encodeIfPresent(self.tracks, forKey: .tracks)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MusicPlaylist?, forKey key: K) throws {
        if let typedValue = value as? SOMusicPlaylist {
            try self.encode(typedValue, forKey: key)
        }
    }
}