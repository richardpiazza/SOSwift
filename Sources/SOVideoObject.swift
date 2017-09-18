import Foundation
import SOSwiftVocabulary

/// A video file.
public class SOVideoObject: SOMediaObject, VideoObject {
    public struct Keys {
        public static let actor = "actor"
        public static let caption = "caption"
        public static let director = "director"
        public static let musicBy = "musicBy"
        public static let thumbnail = "thumbnail"
        public static let transcript = "transcript"
        public static let videoFrameSize = "videoFrameSize"
        public static let videoQuality = "videoQuality"
    }
    
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.actor] {
            self.actor = []
            if let typedValue = value as? [String : AnyObject] {
                self.actor?.append(SOPerson(dictionary: typedValue))
            } else if let typedValue = value as? [[String : AnyObject]] {
                for element in typedValue {
                    self.actor?.append(SOPerson(dictionary: element))
                }
            }
        }
        if let value = dictionary[Keys.caption] as? String {
            self.caption = value
        }
        if let value = dictionary[Keys.director] {
            self.director = []
            if let typedValue = value as? [String : AnyObject] {
                self.director?.append(SOPerson(dictionary: typedValue))
            } else if let typedValue = value as? [[String : AnyObject]] {
                for element in typedValue {
                    self.director?.append(SOPerson(dictionary: element))
                }
            }
        }
        if let value = dictionary[Keys.musicBy] as? [String : AnyObject] {
            self.musicBy = makeMusicGroupOrPerson(dictionary: value)
        }
        if let value = dictionary[Keys.thumbnail] as? [String : AnyObject] {
            self.thumbnail = SOImageObject(dictionary: value)
        }
        if let value = dictionary[Keys.transcript] as? String {
            self.transcript = value
        }
        if let value = dictionary[Keys.videoFrameSize] as? String {
            self.videoFrameSize = value
        }
        if let value = dictionary[Keys.videoQuality] as? String {
            self.videoQuality = value
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.actor as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.actor] = values as AnyObject
        }
        if let value = self.caption {
            dictionary[Keys.caption] = value as AnyObject
        }
        if let value = self.director as? [SOPerson] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.director] = values as AnyObject
        }
        if let value = self.musicBy?.dictionaryValue {
            dictionary[Keys.musicBy] = value
        }
        if let value = self.thumbnail as? SOImageObject {
            dictionary[Keys.thumbnail] = value.dictionary as AnyObject
        }
        if let value = self.transcript {
            dictionary[Keys.transcript] = value as AnyObject
        }
        if let value = self.videoFrameSize {
            dictionary[Keys.videoFrameSize] = value as AnyObject
        }
        if let value = self.videoQuality {
            dictionary[Keys.videoQuality] = value as AnyObject
        }
        return dictionary
    }
}
