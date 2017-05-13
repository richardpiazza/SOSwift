import Foundation

public class Comment: CreativeWork, SchemaComment {
    override public var type: String {
        return "Comment"
    }
}
