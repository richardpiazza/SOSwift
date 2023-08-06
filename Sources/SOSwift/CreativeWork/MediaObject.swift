import Foundation

/// A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset.
///
/// - note: that a creative work may have many media objects associated with it on
///         the same web page. For example, a page about a single song
///         (MusicRecording) may have a music video (VideoObject), and a high and
///         low bandwidth audio stream (2 AudioObject's).
public class MediaObject: CreativeWork {
    
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
    
    /// A URL pointing to a player for a specific video. In general, this is the information
    /// in the src element of an embed tag and should not be the same as the content of the loc tag.
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
    
    /// The regions where the media is allowed. If not specified, then it's assumed to be allowed
    /// everywhere. Specify the countries in ISO 3166 format.
    public var regionsAllowed: Place?
    
    /// Indicates if use of the media require a subscription (either paid or free).
    public var requiresSubscription: Bool?
    
    /// Date when this media object was uploaded to this site.
    public var uploadDate: DateOnly?
    
    /// The width of the item.
    public var width: DistanceOrQuantitativeValue?
    
    internal enum MediaObjectCodingKeys: String, CodingKey {
        case associatedArticle
        case bitrate
        case contentSize
        case contentUrl
        case duration
        case embedUrl
        case encodesCreativeWork
        case encodingFormat
        case expires
        case height
        case playerType
        case productionCompany
        case regionsAllowed
        case requiresSubscription
        case uploadDate
        case width
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: MediaObjectCodingKeys.self)
        
        associatedArticle = try container.decodeIfPresent(NewsArticle.self, forKey: .associatedArticle)
        bitrate = try container.decodeIfPresent(String.self, forKey: .bitrate)
        contentSize = try container.decodeIfPresent(String.self, forKey: .contentSize)
        contentUrl = try container.decodeIfPresent(URL.self, forKey: .contentUrl)
        duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        embedUrl = try container.decodeIfPresent(URL.self, forKey: .embedUrl)
        encodesCreativeWork = try container.decodeIfPresent(CreativeWork.self, forKey: .encodesCreativeWork)
        encodingFormat = try container.decodeIfPresent(String.self, forKey: .encodingFormat)
        expires = try container.decodeIfPresent(DateOnly.self, forKey: .expires)
        height = try container.decodeIfPresent(DistanceOrQuantitativeValue.self, forKey: .height)
        playerType = try container.decodeIfPresent(String.self, forKey: .playerType)
        productionCompany = try container.decodeIfPresent(Organization.self, forKey: .productionCompany)
        regionsAllowed = try container.decodeIfPresent(Place.self, forKey: .regionsAllowed)
        requiresSubscription = try container.decodeIfPresent(Bool.self, forKey: .requiresSubscription)
        uploadDate = try container.decodeIfPresent(DateOnly.self, forKey: .uploadDate)
        width = try container.decodeIfPresent(DistanceOrQuantitativeValue.self, forKey: .width)
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MediaObjectCodingKeys.self)
        
        try container.encodeIfPresent(associatedArticle, forKey: .associatedArticle)
        try container.encodeIfPresent(bitrate, forKey: .bitrate)
        try container.encodeIfPresent(contentSize, forKey: .contentSize)
        try container.encodeIfPresent(contentUrl, forKey: .contentUrl)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(embedUrl, forKey: .embedUrl)
        try container.encodeIfPresent(encodesCreativeWork, forKey: .encodesCreativeWork)
        try container.encodeIfPresent(encodingFormat, forKey: .encodingFormat)
        try container.encodeIfPresent(expires, forKey: .expires)
        try container.encodeIfPresent(height, forKey: .height)
        try container.encodeIfPresent(playerType, forKey: .playerType)
        try container.encodeIfPresent(productionCompany, forKey: .productionCompany)
        try container.encodeIfPresent(regionsAllowed, forKey: .regionsAllowed)
        try container.encodeIfPresent(requiresSubscription, forKey: .requiresSubscription)
        try container.encodeIfPresent(uploadDate, forKey: .uploadDate)
        try container.encodeIfPresent(width, forKey: .width)
        
        try super.encode(to: encoder)
    }
}
