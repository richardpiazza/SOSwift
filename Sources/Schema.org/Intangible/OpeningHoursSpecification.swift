import Foundation

public protocol SchemaOpeningHoursSpecification: Thing {
    var closes: Time? { get set }
    var dayOfWeek: DayOfWeek? { get set }
    var opens: Time? { get set }
    var validFrom: DateTime? { get set }
    var validThrough: DateTime? { get set }
}
