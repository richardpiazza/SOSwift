import Foundation
import SOSwiftVocabulary_ObjC

/// A video file.
public class SOVideoObject: SOMediaObject, VideoObject {
    
    public override class var type: String {
        return "VideoObject"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// An actor, e.g. in tv, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.
    public var actors: [Person]?
    /// The caption for this object.
    public var caption: String?
    /// A director of e.g. tv, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.
    public var directors: [Person]?
    /// The composer of the soundtrack.
    public var musicBy: MusicGroupOrPerson?
    /// Thumbnail image for an image or video.
    public var thumbnail: ImageObject?
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
    public var transcript: String?
    /// The frame size of the video.
    public var videoFrameSize: String?
    /// The quality of the video.
    public var videoQuality: String?
    
    private enum CodingKeys: String, CodingKey {
        case actors = "actor"
        case caption
        case directors = "director"
        case musicBy
        case thumbnail
        case transcript
        case videoFrameSize
        case videoQuality
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.actors = try container.decodeArrayOrElementIfPresent(SOPerson.self, forKey: .actors)
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
        self.directors = try container.decodeArrayOrElementIfPresent(SOPerson.self, forKey: .directors)
        self.musicBy = try container.decodeMusicGroupOrPersonIfPresent(forKey: .musicBy)
        self.thumbnail = try container.decodeIfPresent(SOImageObject.self, forKey: .thumbnail)
        self.transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
        self.videoFrameSize = try container.decodeIfPresent(String.self, forKey: .videoFrameSize)
        self.videoQuality = try container.decodeIfPresent(String.self, forKey: .videoQuality)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.actors, forKey: .actors)
        try container.encodeIfPresent(self.caption, forKey: .caption)
        try container.encodeIfPresent(self.directors, forKey: .directors)
        try container.encodeIfPresent(self.musicBy, forKey: .musicBy)
        try container.encodeIfPresent(self.thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.videoFrameSize, forKey: .videoFrameSize)
        try container.encodeIfPresent(self.videoQuality, forKey: .videoQuality)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: VideoObject?, forKey key: K) throws {
        if let typedValue = value as? SOVideoObject {
            try self.encode(typedValue, forKey: key)
        }
    }
}
