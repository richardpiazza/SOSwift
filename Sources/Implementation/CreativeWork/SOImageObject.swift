import Foundation

/// An image file.
public class SOImageObject: SOMediaObject, ImageObject {
    public struct Keys {
        public static let caption = "caption"
        public static let exifData = "exifData"
        public static let representativeOfPage = "representativeOfPage"
        public static let thumbnail = "thumbnail"
    }
    
    override public class var type: String {
        return "ImageObject"
    }
    
    /// The caption for this object.
    public var caption: String?
    /// exif data for this object.
    public var exifData: PropertyValueOrText?
    /// Indicates whether this image is representative of the content of the page.
    public var representativeOfPage: Bool?
    /// Thumbnail image for an image or video.
    public var thumbnail: ImageObject?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.caption] as? String {
            self.caption = value
        }
        if let value = dictionary[Keys.exifData] {
            self.exifData = makePropertyValueOrText(anyObject: value)
        }
        if let value = dictionary[Keys.representativeOfPage] as? Bool {
            self.representativeOfPage = value
        }
        if let value = dictionary[Keys.thumbnail] as? [String : AnyObject] {
            self.thumbnail = SOImageObject(dictionary: value)
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.caption {
            dictionary[Keys.caption] = value as AnyObject
        }
        if let value = self.exifData?.dictionaryValue {
            dictionary[Keys.exifData] = value
        }
        if let value = self.representativeOfPage {
            dictionary[Keys.representativeOfPage] = value as AnyObject
        }
        if let value = self.thumbnail?.dictionary {
            dictionary[Keys.thumbnail] = value as AnyObject
        }
        return dictionary
    }
}
