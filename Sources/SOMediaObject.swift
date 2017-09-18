import Foundation
import SOSwiftVocabulary

/// A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset i.e. DataDownload.
/// - note: that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject's).
public class SOMediaObject: SOCreativeWork, MediaObject {
    public struct Keys {
        public static let associatedArticle = "associatedArticle"
        public static let bitrate = "bitrate"
        public static let contentSize = "contentSize"
        public static let contentUrl = "contentUrl"
        public static let duration = "duration"
        public static let embedUrl = "embedUrl"
        public static let encodesCreativeWork = "encodesCreativeWork"
        public static let encodingFormat = "encodingFormat"
        public static let expires = "expires"
        public static let height = "height"
        public static let playerType = "playerType"
        public static let productionCompany = "productionCompany"
        public static let regionsAllowed = "regionsAllowed"
        public static let requiresSubscription = "requiresSubscription"
        public static let uploadDate = "uploadDate"
        public static let width = "width"
    }
    
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.associatedArticle] as? [String : AnyObject] {
            self.associatedArticle = SONewsArticle(dictionary: value)
        }
        if let value = dictionary[Keys.bitrate] as? String {
            self.bitrate = value
        }
        if let value = dictionary[Keys.contentSize] as? String {
            self.contentSize = value
        }
        if let value = dictionary[Keys.contentUrl] as? String {
            self.contentUrl = URL(string: value)
        }
        if let value = dictionary[Keys.duration] as? String {
            self.duration = value
        }
        if let value = dictionary[Keys.embedUrl] as? String {
            self.embedUrl = URL(string: value)
        }
        if let value = dictionary[Keys.encodesCreativeWork] as? [String : AnyObject] {
            self.encodesCreativeWork = SOCreativeWork(dictionary: value)
        }
        if let value = dictionary[Keys.encodingFormat] as? String {
            self.encodingFormat = value
        }
        if let value = dictionary[Keys.expires] as? String {
            self.expires = value
        }
        if let value = dictionary[Keys.height] as? [String : AnyObject] {
            self.height = makeDistanceOrQuantitativeValue(dictionary: value)
        }
        if let value = dictionary[Keys.playerType] as? String {
            self.playerType = value
        }
        if let value = dictionary[Keys.productionCompany] as? [String : AnyObject] {
            self.productionCompany = SOOrganization(dictionary: value)
        }
        if let value = dictionary[Keys.regionsAllowed] as? [String : AnyObject] {
            self.regionsAllowed = SOPlace(dictionary: value)
        }
        if let value = dictionary[Keys.requiresSubscription] as? Bool {
            self.requiresSubscription = value
        }
        if let value = dictionary[Keys.uploadDate] as? String {
            self.uploadDate = value
        }
        if let value = dictionary[Keys.width] as? [String : AnyObject] {
            self.width = makeDistanceOrQuantitativeValue(dictionary: value)
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.associatedArticle as? SONewsArticle {
            dictionary[Keys.associatedArticle] = value.dictionary as AnyObject
        }
        if let value = self.bitrate {
            dictionary[Keys.bitrate] = value as AnyObject
        }
        if let value = self.contentSize {
            dictionary[Keys.contentSize] = value as AnyObject
        }
        if let value = self.contentUrl {
            dictionary[Keys.contentUrl] = value.absoluteString as AnyObject
        }
        if let value = self.duration as? String {
            dictionary[Keys.duration] = value as AnyObject
        }
        if let value = self.embedUrl {
            dictionary[Keys.embedUrl] = value.absoluteString as AnyObject
        }
        if let value = self.encodesCreativeWork as? SOCreativeWork {
            dictionary[Keys.encodesCreativeWork] = value.dictionary as AnyObject
        }
        if let value = self.encodingFormat {
            dictionary[Keys.encodingFormat] = value as AnyObject
        }
        if let value = self.expires as? String {
            dictionary[Keys.expires] = value as AnyObject
        }
        if let value = self.height?.dictionaryValue {
            dictionary[Keys.height] = value
        }
        if let value = self.playerType {
            dictionary[Keys.playerType] = value as AnyObject
        }
        if let value = self.productionCompany as? SOOrganization {
            dictionary[Keys.productionCompany] = value.dictionary as AnyObject
        }
        if let value = self.regionsAllowed as? SOPlace {
            dictionary[Keys.regionsAllowed] = value.dictionary as AnyObject
        }
        if let value = self.requiresSubscription {
            dictionary[Keys.requiresSubscription] = value as AnyObject
        }
        if let value = self.uploadDate as? String {
            dictionary[Keys.uploadDate] = value as AnyObject
        }
        if let value = self.width?.dictionaryValue {
            dictionary[Keys.width] = value
        }
        return dictionary
    }
}
