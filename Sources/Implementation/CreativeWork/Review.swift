import Foundation

public class Review: Thing, SchemaReview {
    override public var type: String {
        return "Review"
    }
}
