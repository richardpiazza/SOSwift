import Foundation

/// Specifies a location feature by providing a structured value representing a feature of an accommodation as a property-value pair of varying degrees of formality.
public class LocationFeatureSpecification: PropertyValue, SchemaLocationFeatureSpecification {
    public override var type: String {
        return "LocationFeatureSpecification"
    }
    
    /// The hours during which this service or contact is available.
    public var hoursAvailable: [SchemaOpeningHoursSpecification]?
    /// The date when the item becomes valid.
    public var validFrom: SchemaDateTime?
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    public var validThrough: SchemaDateTime?
}
