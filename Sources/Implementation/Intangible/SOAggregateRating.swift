import Foundation

public class SOAggregateRating: SORating, AggregateRating {
    override public class var type: String {
        return "AggregateRating"
    }
    
}
