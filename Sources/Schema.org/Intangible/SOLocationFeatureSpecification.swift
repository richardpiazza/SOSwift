import Foundation

public protocol SchemaLocationFeatureSpecification: SchemaPropertyValue {
    var hoursAvailable: [SchemaOpeningHoursSpecification]? { get set }
    var validFrom: SchemaDateTime? { get set }
    var validThrough: SchemaDateTime? { get set }
}
