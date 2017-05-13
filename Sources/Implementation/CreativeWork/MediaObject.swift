import Foundation

public class MediaObject: CreativeWork, SchemaMediaObject {
    override public var type: String {
        return "MediaObject"
    }
}
