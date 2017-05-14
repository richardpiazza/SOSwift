import Foundation

/// A video file.
public class SOVideoObject: SOMediaObject, VideoObject {
    override public class var type: String {
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
}
