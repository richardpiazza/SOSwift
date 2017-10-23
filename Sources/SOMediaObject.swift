import Foundation
import SOSwiftVocabulary

/// A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset i.e. DataDownload.
/// - note: that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject's).
public class SOMediaObject: SOCreativeWork, MediaObject {

    public override class var type: String {
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
    
    private enum CodingKeys: String, CodingKey {
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SONewsArticle.self, forKey: .associatedArticle) {
            self.associatedArticle = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .bitrate) {
            self.bitrate = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .contentSize) {
            self.contentSize = value
        }
        if let value = try container.decodeIfPresent(URL.self, forKey: .contentUrl) {
            self.contentUrl = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .duration) {
            self.duration = value
        }
        if let value = try container.decodeIfPresent(URL.self, forKey: .embedUrl) {
            self.embedUrl = value
        }
        if let value = try container.decodeIfPresent(SOCreativeWork.self, forKey: .encodesCreativeWork) {
            self.encodesCreativeWork = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .encodingFormat) {
            self.encodingFormat = value
        }
        self.expires = try container.decodeDateOnlyIfPresent(forKey: .expires)
        if let value = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .height) {
            self.height = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .playerType) {
            self.playerType = value
        }
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey:.productionCompany) {
            self.productionCompany = value
        }
        if let value = try container.decodeIfPresent(SOPlace.self, forKey: .regionsAllowed) {
            self.regionsAllowed = value
        }
        if let value = try container.decodeIfPresent(Bool.self, forKey: .requiresSubscription) {
            self.requiresSubscription = value
        }
        self.uploadDate = try container.decodeDateOnlyIfPresent(forKey: .uploadDate)
        if let value = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .width) {
            self.width = value
        }

        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.associatedArticle as? SONewsArticle {
            try container.encode(value, forKey: .associatedArticle)
        }
        if let value = self.bitrate {
            try container.encode(value, forKey: .bitrate)
        }
        if let value = self.contentSize {
            try container.encode(value, forKey: .contentSize)
        }
        if let value = self.contentUrl {
            try container.encode(value, forKey: .contentUrl)
        }
        if let value = self.duration as? String {
            try container.encode(value, forKey: .duration)
        }
        if let value = self.embedUrl {
            try container.encode(value, forKey: .embedUrl)
        }
        if let value = self.encodesCreativeWork as? SOCreativeWork {
            try container.encode(value, forKey: .encodesCreativeWork)
        }
        if let value = self.encodingFormat {
            try container.encode(value, forKey: .encodingFormat)
        }
        try container.encodeIfPresent(self.expires, forKey: .expires)
        try container.encodeIfPresent(self.height, forKey: .height)
        if let value = self.playerType {
            try container.encode(value, forKey: .playerType)
        }
        if let value = self.productionCompany as? SOOrganization {
            try container.encode(value, forKey: .productionCompany)
        }
        if let value = self.regionsAllowed as? SOPlace {
            try container.encode(value, forKey: .regionsAllowed)
        }
        if let value = self.requiresSubscription {
            try container.encode(value, forKey: .requiresSubscription)
        }
        try container.encodeIfPresent(self.uploadDate, forKey: .uploadDate)
        try container.encodeIfPresent(self.width, forKey: .width)
        
        try super.encode(to: encoder)
    }
}
