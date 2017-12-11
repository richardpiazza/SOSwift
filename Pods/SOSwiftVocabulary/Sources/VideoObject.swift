import Foundation

/// A video file.
public protocol VideoObject: MediaObject {
    /// An actor, e.g. in tv, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.
    /// - schema.org property name: actor
    var actors: [Person]? { get set }
    /// The caption for this object.
    var caption: String? { get set }
    /// A director of e.g. tv, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.
    /// - schema.org property name: director
    var directors: [Person]? { get set }
    /// The composer of the soundtrack.
    var musicBy: MusicGroupOrPerson? { get set }
    /// Thumbnail image for an image or video.
    var thumbnail: ImageObject? { get set }
    /// If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
    var transcript: String? { get set }
    /// The frame size of the video.
    var videoFrameSize: String? { get set }
    /// The quality of the video.
    var videoQuality: String? { get set }
}
