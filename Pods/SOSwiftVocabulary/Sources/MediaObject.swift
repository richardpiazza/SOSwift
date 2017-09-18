import Foundation

/// A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset i.e. DataDownload.
/// - note: that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject's).
public protocol MediaObject: CreativeWork {
    /// A NewsArticle associated with the Media Object.
    var associatedArticle: NewsArticle? { get set }
    /// The bitrate of the media object.
    var bitrate: String? { get set }
    /// File size in (mega/kilo) bytes.
    var contentSize: String? { get set }
    /// Actual bytes of the media object, for example the image file or video file.
    var contentUrl: URL? { get set }
    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    var duration: Duration? { get set }
    /// A URL pointing to a player for a specific video. In general, this is the information in the src element of an embed tag and should not be the same as the content of the loc tag.
    var embedUrl: URL? { get set }
    /// The CreativeWork encoded by this media object.
    var encodesCreativeWork: CreativeWork? { get set }
    /// mp3, mpeg4, etc.
    var encodingFormat: String? { get set }
    /// Date the content expires and is no longer useful or available. Useful for videos.
    var expires: DateOnly? { get set }
    /// The height of the item.
    var height: DistanceOrQuantitativeValue? { get set }
    /// Player type required—for example, Flash or Silverlight.
    var playerType: String? { get set }
    /// The production company or studio responsible for the item e.g. series, video game, episode etc.
    var productionCompany: Organization? { get set }
    /// The regions where the media is allowed. If not specified, then it's assumed to be allowed everywhere. Specify the countries in ISO 3166 format.
    var regionsAllowed: Place? { get set }
    /// Indicates if use of the media require a subscription (either paid or free).
    var requiresSubscription: Bool? { get set }
    /// Date when this media object was uploaded to this site.
    var uploadDate: DateOnly? { get set }
    /// The width of the item.
    var width: DistanceOrQuantitativeValue? { get set }
}
