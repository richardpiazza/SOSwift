import Foundation
import SOSwiftVocabulary

/// An image file.
public class SOImageObject: SOMediaObject, ImageObject {

    public override class var type: String {
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
    
    private enum CodingKeys: String, CodingKey {
        case caption
        case exifData
        case representativeOfPage
        case thumbnail
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .caption) {
            self.caption = value
        }
        if let value = try container.decodePropertyValueOrTextIfPresent(forKey: .exifData) {
            self.exifData = value
        }
        if let value = try container.decodeIfPresent(Bool.self, forKey: .representativeOfPage) {
            self.representativeOfPage = value
        }
        if let value = try container.decodeIfPresent(SOImageObject.self, forKey: .thumbnail) {
            self.thumbnail = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.caption {
            try container.encode(value, forKey: .caption)
        }
        if let value = self.exifData {
            try container.encodePropertyValueOrText(value, forKey: .exifData)
        }
        if let value = self.representativeOfPage {
            try container.encode(value, forKey: .representativeOfPage)
        }
        if let value = self.thumbnail as? SOImageObject {
            try container.encode(value, forKey: .thumbnail)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
