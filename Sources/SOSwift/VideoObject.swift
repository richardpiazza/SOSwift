import Foundation

/// A video file.
public class VideoObject: MediaObject {
    
    /// An actor, e.g. in tv, radio, movie, video games etc., or in an event. Actors
    /// can be associated with individual items or with a series, episode, clip.
    public var actors: [Person]?
    
    /// The caption for this object.
    public var caption: String?
    
    /// A director of e.g. tv, radio, movie, video gaming etc. content, or of an event.
    /// Directors can be associated with individual items or with a series, episode, clip.
    public var directors: [Person]?
    
    /// The composer of the soundtrack.
    public var musicBy: MusicGroupOrPerson?
    
    /// Thumbnail image for an image or video.
    public var thumbnail: ImageObject?
    
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that
    /// object.
    public var transcript: String?
    
    /// The frame size of the video.
    public var videoFrameSize: String?
    
    /// The quality of the video.
    public var videoQuality: String?
    
    internal enum VideoObjectCodingKeys: String, CodingKey {
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
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: VideoObjectCodingKeys.self)
        
        actors = try container.decodeIfPresent([Person].self, forKey: .actors)
        caption = try container.decodeIfPresent(String.self, forKey: .caption)
        directors = try container.decodeIfPresent([Person].self, forKey: .directors)
        musicBy = try container.decodeIfPresent(MusicGroupOrPerson.self, forKey: .musicBy)
        thumbnail = try container.decodeIfPresent(ImageObject.self, forKey: .thumbnail)
        transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
        videoFrameSize = try container.decodeIfPresent(String.self, forKey: .videoFrameSize)
        videoQuality = try container.decodeIfPresent(String.self, forKey: .videoQuality)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: VideoObjectCodingKeys.self)
        
        try container.encodeIfPresent(actors, forKey: .actors)
        try container.encodeIfPresent(caption, forKey: .caption)
        try container.encodeIfPresent(directors, forKey: .directors)
        try container.encodeIfPresent(musicBy, forKey: .musicBy)
        try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(transcript, forKey: .transcript)
        try container.encodeIfPresent(videoFrameSize, forKey: .videoFrameSize)
        try container.encodeIfPresent(videoQuality, forKey: .videoQuality)
        
        try super.encode(to: encoder)
    }
}
