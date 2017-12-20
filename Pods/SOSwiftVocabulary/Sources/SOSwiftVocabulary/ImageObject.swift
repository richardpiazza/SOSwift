import Foundation

public protocol ImageObjectConformance:
                    ImageObjectOrURL,
                    ImageObjectOrPhotograph {}

/// An image file.
public protocol ImageObject: MediaObject, ImageObjectConformance {
    /// The caption for this object.
    var caption: String? { get set }
    /// exif data for this object.
    var exifData: PropertyValueOrText? { get set }
    /// Indicates whether this image is representative of the content of the page.
    var representativeOfPage: Bool? { get set }
    /// Thumbnail image for an image or video.
    var thumbnail: ImageObject? { get set }
}
