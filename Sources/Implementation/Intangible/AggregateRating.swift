import Foundation

public class AggregateRating: Rating, SchemaAggregateRating {
    override public var type: String {
        return "AggregateRating"
    }
    
}
