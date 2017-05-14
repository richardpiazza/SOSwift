import Foundation

public class AggregateRating: Rating, SchemaAggregateRating {
    override public class var type: String {
        return "AggregateRating"
    }
    
}
