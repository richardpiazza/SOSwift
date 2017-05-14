import Foundation

public class Comment: CreativeWork, SchemaComment {
    override public class var type: String {
        return "Comment"
    }
}
