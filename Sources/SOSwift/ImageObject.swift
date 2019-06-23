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
    
}
