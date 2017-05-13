import Foundation

/// A structured value providing information about the opening hours of a place or a certain service inside a place.
/// The place is open if the opens property is specified, and closed otherwise.
/// If the value for the closes property is less than the value for the opens property then the hour range is assumed to span over the next day.
public class OpeningHoursSpecification: Thing, SchemaOpeningHoursSpecification {
    public override var type: String {
        return "OpeningHoursSpecification"
    }
    
    /// The closing hour of the place or service on the given day(s) of the week.
    public var closes: SchemaTime?
    /// The day of the week for which these opening hours are valid.
    public var dayOfWeek: DayOfWeek?
    /// The opening hour of the place or service on the given day(s) of the week.
    public var opens: SchemaTime?
    /// The date when the item becomes valid.
    public var validFrom: SchemaDateTime?
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    public var validThrough: SchemaDateTime?
}
