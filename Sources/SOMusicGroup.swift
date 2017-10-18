import Foundation
import SOSwiftVocabulary

/// A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.
public class SOMusicGroup: SOPerformingGroup, MusicGroup {

    public override class var type: String {
        return "MusicGroup"
    }
    
    /// A music album.
    public var album: [MusicAlbum]?
    /// Genre of the creative work, broadcast channel or group.
    public var genre: TextOrURL?
    /// A music recording (track) - usually a single song. If an ItemList is given, the list should contain items of type MusicRecording.
    public var track: [ItemListOrMusicRecording]?
    
    private enum CodingKeys: String, CodingKey {
        case album
        case genre
        case track
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent([SOMusicAlbum].self, forKey: .album) {
            self.album = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .genre) {
            self.genre = value
        }
        if let value = try container.decodeItemListsOrMusicRecordingsIfPresent(forKey: .track) {
            self.track = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.album  as? [SOMusicAlbum] {
            try container.encode(value, forKey: .album)
        }
        if let value = self.genre {
            try container.encodeTextOrURL(value, forKey: .genre)
        }
        if let value = self.track {
            try container.encodeItemListsOrMusicRecordings(value, forKey: .track)
        }
        
        try super.encode(to: encoder)
    }
}
