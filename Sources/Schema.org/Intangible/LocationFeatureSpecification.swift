import Foundation

public protocol SchemaLocationFeatureSpecification: PropertyValue {
    var hoursAvailable: [SchemaOpeningHoursSpecification]? { get set }
    var validFrom: DateTime? { get set }
    var validThrough: DateTime? { get set }
}
