import Foundation

public protocol MonetaryAmountConformance:
                    MonetaryAmountOrPriceSpecification
                {}

/// A monetary value or range.
/// This type can be used to describe an amount of money such as $50 USD, or a range as in describing a bank account being suitable for a balance between £1,000 and £1,000,000 GBP, or the value of a salary, etc.
/// It is recommended to use PriceSpecification Types to describe the price of an Offer, Invoice, etc.
public protocol MonetaryAmount: Thing, MonetaryAmountConformance {
    /// The currency in which the monetary amount is expressed (in 3-letter ISO 4217 format).
    var currency: String? { get set }
    /// The upper value of some characteristic or property.
    var maxValue: Number? { get set }
    /// The lower value of some characteristic or property.
    var minValue: Number? { get set }
    /// The date when the item becomes valid.
    var validFrom: DateTime? { get set }
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    var validThrough: DateTime? { get set }
    /// The value of the quantitative value or property value node.
    /// - For QuantitativeValue and MonetaryAmount, the recommended type for values is 'Number'.
    /// - For PropertyValue, it can be 'Text;', 'Number', 'Boolean', or 'StructuredValue'.
    var value: Value? { get set }
}
