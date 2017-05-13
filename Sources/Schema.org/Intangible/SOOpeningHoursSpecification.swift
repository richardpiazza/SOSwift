import Foundation

public protocol SchemaOpeningHoursSpecification: SchemaThing {
    var closes: SchemaTime? { get set }
    var dayOfWeek: DayOfWeek? { get set }
    var opens: SchemaTime? { get set }
    var validFrom: SchemaDateTime? { get set }
    var validThrough: SchemaDateTime? { get set }
}
