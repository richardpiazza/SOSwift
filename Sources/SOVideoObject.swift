import Foundation
import SOSwiftVocabulary

/// A video file.
public class SOVideoObject: SOMediaObject, VideoObject {
    
    public override class var type: String {
        return "VideoObject"
    }
    
    /// An actor, e.g. in tv, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.
    public var actor: [Person]?
    /// The caption for this object.
    public var caption: String?
    /// A director of e.g. tv, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.
    public var director: [Person]?
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
        case actor
        case caption
        case director
        case musicBy
        case thumbnail
        case transcript
        case videoFrameSize
        case videoQuality
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .actor) {
            self.actor = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .caption) {
            self.caption = value
        }
        if let value = try container.decodeIfPresent([SOPerson].self, forKey: .director) {
            self.director = value
        }
        if let value = try container.decodeMusicGroupOrPersonIfPresent(forKey: .musicBy) {
            self.musicBy = value
        }
        if let value = try container.decodeIfPresent(SOImageObject.self, forKey: .thumbnail) {
            self.thumbnail = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .transcript) {
            self.transcript = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .videoFrameSize) {
            self.videoFrameSize = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .videoQuality) {
            self.videoQuality = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.actor as? [SOPerson] {
            try container.encode(value, forKey: .actor)
        }
        if let value = self.caption {
            try container.encode(value, forKey: .caption)
        }
        if let value = self.director as? [SOPerson] {
            try container.encode(value, forKey: .director)
        }
        try container.encodeIfPresent(self.musicBy, forKey: .musicBy)
        if let value = self.thumbnail as? SOImageObject {
            try container.encode(value, forKey: .thumbnail)
        }
        if let value = self.transcript {
            try container.encode(value, forKey: .transcript)
        }
        if let value = self.videoFrameSize {
            try container.encode(value, forKey: .videoFrameSize)
        }
        if let value = self.videoQuality {
            try container.encode(value, forKey: .videoQuality)
        }
        
        try super.encode(to: encoder)
    }
}
