import Foundation

/// Specifies a location feature by providing a structured value representing a feature of an accommodation as a property-value pair of varying degrees of formality.
public protocol LocationFeatureSpecification: PropertyValue {
    /// The hours during which this service or contact is available.
    var hoursAvailable: [OpeningHoursSpecification]? { get set }
    /// The date when the item becomes valid.
    var validFrom: DateTime? { get set }
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    var validThrough: DateTime? { get set }
}
