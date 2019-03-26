import Foundation
import SOSwiftVocabulary

/// An image file.
public class SOImageObject: SOMediaObject, ImageObject {

    public override class var type: String {
        return "ImageObject"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
        self.exifData = try container.decodePropertyValueOrTextIfPresent(forKey: .exifData)
        self.representativeOfPage = try container.decodeIfPresent(Bool.self, forKey: .representativeOfPage)
        self.thumbnail = try container.decodeIfPresent(SOImageObject.self, forKey: .thumbnail)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.caption, forKey: .caption)
        try container.encodeIfPresent(self.exifData, forKey: .exifData)
        try container.encodeIfPresent(self.representativeOfPage, forKey: .representativeOfPage)
        try container.encodeIfPresent(self.thumbnail, forKey: .thumbnail)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.caption.rawValue:
            return "The caption for this object."
        case CodingKeys.exifData.rawValue:
            return "exif data for this object."
        case CodingKeys.representativeOfPage.rawValue:
            return "Indicates whether this image is representative of the content of the page."
        case CodingKeys.thumbnail.rawValue:
            return "Thumbnail image for an image or video."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.caption.rawValue:
            self.caption = value as? String
        case CodingKeys.exifData.rawValue:
            self.exifData = value as? PropertyValueOrText
        case CodingKeys.representativeOfPage.rawValue:
            self.representativeOfPage = value as? Bool
        case CodingKeys.thumbnail.rawValue:
            self.thumbnail = value as? ImageObject
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: ImageObject?, forKey key: K) throws {
        if let typedValue = value as? SOImageObject {
            try self.encode(typedValue, forKey: key)
        }
    }
}
