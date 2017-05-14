import Foundation

public protocol LocationFeatureSpecification: PropertyValue {
    var hoursAvailable: [OpeningHoursSpecification]? { get set }
    var validFrom: DateTime? { get set }
    var validThrough: DateTime? { get set }
}
