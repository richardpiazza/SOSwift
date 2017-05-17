import Foundation

/// A review of an item - for example, of a restaurant, movie, or store.
public class SOReview: SOCreativeWork, Review {
    public struct Keys {
        public static let itemReviewed = "itemReviewed"
        public static let reviewBody = "reviewBody"
        public static let reviewRating = "reviewRating"
    }
    
    override public class var type: String {
        return "Review"
    }
    
    /// The item that is being reviewed/rated.
    public var itemReviewed: Thing?
    /// The actual body of the review.
    public var reviewBody: String?
    /// The rating given in this review.
    /// - note: Reviews can themselves be rated. The reviewRating applies to rating given by the review. The aggregateRating property applies to the review itself, as a creative work.
    public var reviewRating: Rating?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.itemReviewed] as? [String : AnyObject] {
            self.itemReviewed = SOThing(dictionary: value)
        }
        if let value = dictionary[Keys.reviewBody] as? String {
            self.reviewBody = value
        }
        if let value = dictionary[Keys.reviewRating] as? [String : AnyObject] {
            self.reviewRating = SORating(dictionary: value)
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.itemReviewed?.dictionary {
            dictionary[Keys.itemReviewed] = value as AnyObject
        }
        if let value = self.reviewBody {
            dictionary[Keys.reviewBody] = value as AnyObject
        }
        if let value = self.reviewRating?.dictionary {
            dictionary[Keys.reviewRating] = value as AnyObject
        }
        return dictionary
    }
}
