import Foundation
import SOSwiftVocabulary

/// A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.
public class SOMusicGroup: SOPerformingGroup, MusicGroup {
    
    public override class var type: String {
        return "MusicGroup"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return []
    }
    
    /// A music album.
    public var album: [MusicAlbum]?
    /// Genre of the creative work, broadcast channel or group.
    public var genre: URLOrText?
    /// A music recording (track) - usually a single song. If an ItemList is given, the list should contain items of type MusicRecording.
    public var tracks: [ItemListOrMusicRecording]?
    
    private enum CodingKeys: String, CodingKey {
        case album
        case genre
        case tracks = "track"
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.album = try container.decodeIfPresent([SOMusicAlbum].self, forKey: .album)
        self.genre = try container.decodeURLOrTextIfPresent(forKey: .genre)
        self.tracks = try container.decodeItemListsOrMusicRecordingsIfPresent(forKey: .tracks)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.album, forKey: .album)
        try container.encodeIfPresent(self.genre, forKey: .genre)
        try container.encodeIfPresent(self.tracks, forKey: .tracks)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MusicGroup?, forKey key: K) throws {
        if let typedValue = value as? SOMusicGroup {
            try self.encode(typedValue, forKey: key)
        }
    }
}
