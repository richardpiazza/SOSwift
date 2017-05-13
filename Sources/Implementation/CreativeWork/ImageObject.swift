import Foundation

public class ImageObject: MediaObject, SchemaImageObject, SchemaImageObjectOrURL {
    override public var type: String {
        return "ImageObject"
    }
    
    var caption: String?
    var exifData: AnyObject?
    var representativeOfPage: Any?
    var thumbnail: ImageObject?
}
