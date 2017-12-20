import Foundation

public protocol PriceSpecificationConformance:
                    MonetaryAmountOrPriceSpecification
                {}

/// A structured value representing a price or price range.
/// Typically, only the subclasses of this type are used for markup.
/// It is recommended to use MonetaryAmount to describe independent amounts of money such as a salary, credit card limits, etc.
public protocol PriceSpecification: StructuredValue, PriceSpecificationConformance {
    /// The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.
    var eligibleQuantity: QuantitativeValue? { get set }
    /// The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.
    var eligibleTransactionVolume: PriceSpecification? { get set }
    /// The highest price if the price is a range.
    var maxPrice: Number? { get set }
    /// The lowest price if the price is a range.
    var minPrice: Number? { get set }
    /// The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes. Usage guidelines:
    /// - Use the priceCurrency property (with ISO 4217 codes e.g. "USD") instead of including ambiguous symbols such as '$' in the value.
    /// - Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator.
    /// - note: Both RDFa and Microdata syntax allow the use of a "content=" attribute for publishing simple machine-readable values alongside more human-friendly formatting.
    /// - Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols.
    var price: NumberOrText? { get set }
    /// The currency (in 3-letter ISO 4217 format) of the price or a price component, when attached to PriceSpecification and its subtypes.
    var priceCurrency: String? { get set }
    /// The date when the item becomes valid.
    var validFrom: DateTime? { get set }
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    var validThrough: DateTime? { get set }
    /// Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.
    var valueAddedTaxIncluded: Bool? { get set }
}
