import Foundation

public protocol MonetaryAmount: Thing, MonetaryAmountOrPriceSpecification {
    var currency: String? { get set }
    var maxValue: Number? { get set }
    var minValue: Number? { get set }
    var validFrom: DateTime? { get set }
    var validThrough: DateTime? { get set }
    var value: Value? { get set }
}
