import Foundation

/// A structured value representing a price or price range. Typically, only the subclasses
/// of this type are used for markup. It is recommended to use `MonetaryAmount` to
/// describe independent amounts of money such as a salary, credit card limits, etc.
public class PriceSpecification: StructuredValue {

    /// The interval and unit of measurement of ordering quantities for which the offer
    /// or price specification is valid. This allows e.g. specifying that a certain freight
    /// charge is valid only for a certain quantity.
    public var eligibleQuantity: QuantitativeValue?

    /// The transaction volume, in a monetary unit, for which the offer or price
    /// specification is valid, e.g. for indicating a minimal purchasing volume, to
    /// express free shipping above a certain order volume, or to limit the acceptance
    /// of credit cards to purchases to a certain minimal amount.
    public var eligibleTransactionVolume: PriceSpecification?

    /// The highest price if the price is a range.
    public var maxPrice: Number?

    /// The lowest price if the price is a range.
    public var minPrice: Number?

    /// The offer price of a product, or of a price component when attached to
    /// PriceSpecification and its subtypes.
    /// Usage guidelines:
    /// - Use the priceCurrency property (with ISO 4217 codes e.g. "USD") instead of
    ///     including ambiguous symbols such as '$' in the value.
    /// - Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point.
    ///     Avoid using these symbols as a readability separator.
    /// - note: that both RDFa and Microdata syntax allow the use of a "content=" attribute
    ///     for publishing simple machine-readable values alongside more human-friendly formatting.
    /// - Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039))
    ///     rather than superficially similiar Unicode symbols.
    public var price: NumberOrText?

    /// The currency (in 3-letter ISO 4217 format) of the price or a price component,
    /// when attached to PriceSpecification and its subtypes.
    public var priceCurrency: String?

    /// The date when the item becomes valid.
    public var validFrom: DateTime?

    /// The date after when the item is not valid. For example the end of an offer, salary
    /// period, or a period of opening hours.
    public var validThrough: DateTime?

    /// Specifies whether the applicable value-added tax (VAT) is included in the price
    /// specification or not.
    public var valueAddedTaxIncluded: Bool?

    enum PriceSpecificationCodingKeys: String, CodingKey {
        case eligibleQuantity
        case eligibleTransactionVolume
        case maxPrice
        case minPrice
        case price
        case priceCurrency
        case validFrom
        case validThrough
        case valueAddedTaxIncluded
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: PriceSpecificationCodingKeys.self)

        eligibleQuantity = try container.decodeIfPresent(QuantitativeValue.self, forKey: .eligibleQuantity)
        eligibleTransactionVolume = try container.decodeIfPresent(PriceSpecification.self, forKey: .eligibleTransactionVolume)
        maxPrice = try container.decodeIfPresent(Number.self, forKey: .maxPrice)
        minPrice = try container.decodeIfPresent(Number.self, forKey: .minPrice)
        price = try container.decodeIfPresent(NumberOrText.self, forKey: .price)
        priceCurrency = try container.decodeIfPresent(String.self, forKey: .priceCurrency)
        validFrom = try container.decodeIfPresent(DateTime.self, forKey: .validFrom)
        validThrough = try container.decodeIfPresent(DateTime.self, forKey: .validThrough)
        valueAddedTaxIncluded = try container.decodeIfPresent(Bool.self, forKey: .valueAddedTaxIncluded)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PriceSpecificationCodingKeys.self)

        try container.encodeIfPresent(eligibleQuantity, forKey: .eligibleQuantity)
        try container.encodeIfPresent(eligibleTransactionVolume, forKey: .eligibleTransactionVolume)
        try container.encodeIfPresent(maxPrice, forKey: .maxPrice)
        try container.encodeIfPresent(minPrice, forKey: .minPrice)
        try container.encodeIfPresent(price, forKey: .price)
        try container.encodeIfPresent(priceCurrency, forKey: .priceCurrency)
        try container.encodeIfPresent(validFrom, forKey: .validFrom)
        try container.encodeIfPresent(validThrough, forKey: .validThrough)
        try container.encodeIfPresent(valueAddedTaxIncluded, forKey: .valueAddedTaxIncluded)

        try super.encode(to: encoder)
    }
}
