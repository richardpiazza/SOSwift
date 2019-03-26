import Foundation
import SOSwiftVocabulary

/// A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset i.e. DataDownload.
/// - note: that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject's).
public class SOMediaObject: SOCreativeWork, MediaObject {

    public override class var type: String {
        return "MediaObject"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOAudioObject.self,
            SODataDownload.self,
            SOImageObject.self,
            SOVideoObject.self
        ]
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.associatedArticle = try container.decodeIfPresent(SONewsArticle.self, forKey: .associatedArticle)
        self.bitrate = try container.decodeIfPresent(String.self, forKey: .bitrate)
        self.contentSize = try container.decodeIfPresent(String.self, forKey: .contentSize)
        self.contentUrl = try container.decodeIfPresent(URL.self, forKey: .contentUrl)
        self.duration = try container.decodeDurationIfPresent(forKey: .duration)
        self.embedUrl = try container.decodeIfPresent(URL.self, forKey: .embedUrl)
        self.encodesCreativeWork = try container.decodeIfPresent(SOCreativeWork.self, forKey: .encodesCreativeWork)
        self.encodingFormat = try container.decodeIfPresent(String.self, forKey: .encodingFormat)
        self.expires = try container.decodeDateOnlyIfPresent(forKey: .expires)
        self.height = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .height)
        self.playerType = try container.decodeIfPresent(String.self, forKey: .playerType)
        self.productionCompany = try container.decodeIfPresent(SOOrganization.self, forKey:.productionCompany)
        self.regionsAllowed = try container.decodeIfPresent(SOPlace.self, forKey: .regionsAllowed)
        self.requiresSubscription = try container.decodeIfPresent(Bool.self, forKey: .requiresSubscription)
        self.uploadDate = try container.decodeDateOnlyIfPresent(forKey: .uploadDate)
        self.width = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .width)

        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.associatedArticle, forKey: .associatedArticle)
        try container.encodeIfPresent(self.bitrate, forKey: .bitrate)
        try container.encodeIfPresent(self.contentSize, forKey: .contentSize)
        try container.encodeIfPresent(self.contentUrl, forKey: .contentUrl)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.embedUrl, forKey: .embedUrl)
        try container.encodeIfPresent(self.encodesCreativeWork, forKey: .encodesCreativeWork)
        try container.encodeIfPresent(self.encodingFormat, forKey: .encodingFormat)
        try container.encodeIfPresent(self.expires, forKey: .expires)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.playerType, forKey: .playerType)
        try container.encodeIfPresent(self.productionCompany, forKey: .productionCompany)
        try container.encodeIfPresent(self.regionsAllowed, forKey: .regionsAllowed)
        try container.encodeIfPresent(self.requiresSubscription, forKey: .requiresSubscription)
        try container.encodeIfPresent(self.uploadDate, forKey: .uploadDate)
        try container.encodeIfPresent(self.width, forKey: .width)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.associatedArticle.rawValue:
            return "A NewsArticle associated with the Media Object."
        case CodingKeys.bitrate.rawValue:
            return "The bitrate of the media object."
        case CodingKeys.contentSize.rawValue:
            return "File size in (mega/kilo) bytes."
        case CodingKeys.contentUrl.rawValue:
            return "Actual bytes of the media object, for example the image file or video file."
        case CodingKeys.duration.rawValue:
            return "The duration of the item."
        case CodingKeys.embedUrl.rawValue:
            return "A URL pointing to a player for a specific video."
        case CodingKeys.encodesCreativeWork.rawValue:
            return "The CreativeWork encoded by this media object."
        case CodingKeys.encodingFormat.rawValue:
            return "Format of encoding: mp3, mpeg4, etc."
        case CodingKeys.expires.rawValue:
            return "Date the content expires and is no longer useful or available. Useful for videos."
        case CodingKeys.height.rawValue:
            return "The height of the item."
        case CodingKeys.playerType.rawValue:
            return "Player type required."
        case CodingKeys.productionCompany.rawValue:
            return "The production company or studio responsible for the item e.g. series, video game, episode etc."
        case CodingKeys.regionsAllowed.rawValue:
            return "The regions where the media is allowed."
        case CodingKeys.requiresSubscription.rawValue:
            return "Indicates if use of the media require a subscription (either paid or free)."
        case CodingKeys.uploadDate.rawValue:
            return "Date when this media object was uploaded to this site."
        case CodingKeys.width.rawValue:
            return "The width of the item."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.associatedArticle.rawValue:
            self.associatedArticle = value as? NewsArticle
        case CodingKeys.bitrate.rawValue:
            self.bitrate = value as? String
        case CodingKeys.contentSize.rawValue:
            self.contentSize = value as? String
        case CodingKeys.contentUrl.rawValue:
            self.contentUrl = value as? URL
        case CodingKeys.duration.rawValue:
            self.duration = value as? Duration
        case CodingKeys.embedUrl.rawValue:
            self.embedUrl = value as? URL
        case CodingKeys.encodesCreativeWork.rawValue:
            self.encodesCreativeWork = value as? CreativeWork
        case CodingKeys.encodingFormat.rawValue:
            self.encodingFormat = value as? String
        case CodingKeys.expires.rawValue:
            self.expires = value as? DateOnly
        case CodingKeys.height.rawValue:
            self.height = value as? DistanceOrQuantitativeValue
        case CodingKeys.playerType.rawValue:
            self.playerType = value as? String
        case CodingKeys.productionCompany.rawValue:
            self.productionCompany = value as? Organization
        case CodingKeys.regionsAllowed.rawValue:
            self.regionsAllowed = value as? Place
        case CodingKeys.requiresSubscription.rawValue:
            self.requiresSubscription = value as? Bool
        case CodingKeys.uploadDate.rawValue:
            self.uploadDate = value as? DateOnly
        case CodingKeys.width.rawValue:
            self.width = value as? DistanceOrQuantitativeValue
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: MediaObject?, forKey key: K) throws {
        if let typedValue = value as? SOMediaObject {
            try self.encode(typedValue, forKey: key)
        }
    }
}
