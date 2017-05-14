import Foundation

public class MediaObject: CreativeWork, SchemaMediaObject {
    override public class var type: String {
        return "MediaObject"
    }
}
