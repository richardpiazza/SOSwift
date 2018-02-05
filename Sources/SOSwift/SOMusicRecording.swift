import Foundation
import SOSwiftVocabulary

/// A music recording (track), usually a single song.
public class SOMusicRecording: SOCreativeWork, MusicRecording {
    
    public override class var type: String {
        return "MusicRecording"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The artist that performed this album or recording.
    public var byArtist: MusicGroup?
    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    public var duration: Duration?
    /// The album to which this recording belongs.
    public var inAlbum: MusicAlbum?
    /// The playlist to which this recording belongs.
    public var inPlaylist: MusicPlaylist?
    /// The International Standard Recording Code for the recording.
    public var isrcCode: String?
    /// The composition this track is a recording of.
    /// - Inverse property: recordedAs.
    public var recordingOf: MusicComposition?
    
    private enum CodingKeys: String, CodingKey {
        case byArtist
        case duration
        case inAlbum
        case inPlaylist
        case isrcCode
        case recordingOf
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.byArtist = try container.decodeIfPresent(SOMusicGroup.self, forKey: .byArtist)
        self.duration = try container.decodeDurationIfPresent(forKey: .duration)
        self.inAlbum = try container.decodeIfPresent(SOMusicAlbum.self, forKey: .inAlbum)
        self.inPlaylist = try container.decodeIfPresent(SOMusicPlaylist.self, forKey: .inPlaylist)
        self.isrcCode = try container.decodeIfPresent(String.self, forKey: .isrcCode)
        self.recordingOf = try container.decodeIfPresent(SOMusicComposition.self, forKey: .recordingOf)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.byArtist, forKey: .byArtist)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.inAlbum, forKey: .inAlbum)
        try container.encodeIfPresent(self.inPlaylist, forKey: .inPlaylist)
        try container.encodeIfPresent(self.isrcCode, forKey: .isrcCode)
        try container.encodeIfPresent(self.recordingOf, forKey: .recordingOf)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MusicRecording?, forKey key: K) throws {
        if let typedValue = value as? SOMusicRecording {
            try self.encode(typedValue, forKey: key)
        }
    }
}