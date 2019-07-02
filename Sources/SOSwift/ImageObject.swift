import Foundation

/// An image file.
public class ImageObject: MediaObject {
    
    /// The caption for this object.
    public var caption: String?
    
    /// exif data for this object.
    public var exifData: PropertyValueOrText?
    
    /// Indicates whether this image is representative of the content of the page.
    public var representativeOfPage: Bool?
    
    /// Thumbnail image for an image or video.
    public var thumbnail: ImageObject?
    
    internal enum ImageObjectCodingKeys: String, CodingKey {
        case caption
        case exifData
        case representativeOfPage
        case thumbnail
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: ImageObjectCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ImageObjectCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }

}
