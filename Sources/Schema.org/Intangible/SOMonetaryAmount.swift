import Foundation

public protocol SchemaMonetaryAmount: SchemaThing, SchemaMonetaryAmountOrPriceSpecification {
    var currency: String? { get set }
    var maxValue: SchemaNumber? { get set }
    var minValue: SchemaNumber? { get set }
    var validFrom: SchemaDateTime? { get set }
    var validThrough: SchemaDateTime? { get set }
    var value: SchemaBooleanOrNumberOrStructuredValueOrText? { get set }
}
