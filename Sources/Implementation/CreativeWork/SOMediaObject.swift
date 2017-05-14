import Foundation

/// A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset i.e. DataDownload.
/// - note: that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject's).
public class SOMediaObject: SOCreativeWork, MediaObject {
    override public class var type: String {
        return "MediaObject"
    }
    
    /// A NewsArticle associated with the Media Object.
    public var associatedArticle: NewsArticle?
    /// The bitrate of the media object.
    public var bitrate: String?
    /// File size in (mega/kilo) bytes.
    public var contentSize: String?
    /// Actual bytes of the media object, for example the image file or video file.
    public var contentUrl: URL?
    /// The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
    public var duration: Duration?
    /// A URL pointing to a player for a specific video. In general, this is the information in the src element of an embed tag and should not be the same as the content of the loc tag.
    public var embedUrl: URL?
    /// The CreativeWork encoded by this media object.
    public var encodesCreativeWork: CreativeWork?
    /// mp3, mpeg4, etc.
    public var encodingFormat: String?
    /// Date the content expires and is no longer useful or available. Useful for videos.
    public var expires: DateOnly?
    /// The height of the item.
    public var height: DistanceOrQuantitativeValue?
    /// Player type required—for example, Flash or Silverlight.
    public var playerType: String?
    /// The production company or studio responsible for the item e.g. series, video game, episode etc.
    public var productionCompany: Organization?
    /// The regions where the media is allowed. If not specified, then it's assumed to be allowed everywhere. Specify the countries in ISO 3166 format.
    public var regionsAllowed: Place?
    /// Indicates if use of the media require a subscription (either paid or free).
    public var requiresSubscription: Bool?
    /// Date when this media object was uploaded to this site.
    public var uploadDate: DateOnly?
    /// The width of the item.
    public var width: DistanceOrQuantitativeValue?
}
