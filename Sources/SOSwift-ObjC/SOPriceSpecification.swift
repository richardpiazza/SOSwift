import Foundation
import SOSwiftVocabulary_ObjC

/// A structured value representing a price or price range. Typically, only the subclasses of this type are used for markup.
/// It is recommended to use `MonetaryAmount` to describe independent amounts of money such as a salary, credit card limits, etc.
public class SOPriceSpecification: SOStructuredValue, PriceSpecification {
    
    public override class var type: String {
        return "PriceSpecification"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.
    public var eligibleQuantity: QuantitativeValue?
    /// The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.
    public var eligibleTransactionVolume: PriceSpecification?
    /// The highest price if the price is a range.
    public var maxPrice: Number?
    /// The lowest price if the price is a range.
    public var minPrice: Number?
    /// The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes. Usage guidelines:
    /// - Use the priceCurrency property (with ISO 4217 codes e.g. "USD") instead of including ambiguous symbols such as '$' in the value.
    /// - Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator.
    /// - note: that both RDFa and Microdata syntax allow the use of a "content=" attribute for publishing simple machine-readable values alongside more human-friendly formatting.
    /// - Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols.
    public var price: NumberOrText?
    /// The currency (in 3-letter ISO 4217 format) of the price or a price component, when attached to PriceSpecification and its subtypes.
    public var priceCurrency: String?
    /// The date when the item becomes valid.
    public var validFrom: DateTime?
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    public var validThrough: DateTime?
    /// Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.
    public var valueAddedTaxIncludedRawValue: NSNumber?
    
    private enum CodingKeys: String, CodingKey {
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.eligibleQuantity = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .eligibleQuantity)
        self.eligibleTransactionVolume = try container.decodeIfPresent(SOPriceSpecification.self, forKey: .eligibleTransactionVolume)
        self.maxPrice = try container.decodeNumberIfPresent(forKey: .maxPrice)
        self.minPrice = try container.decodeNumberIfPresent(forKey: .minPrice)
        self.price = try container.decodeNumberOrTextIfPresent(forKey: .price)
        self.priceCurrency = try container.decodeIfPresent(String.self, forKey: .priceCurrency)
        self.validFrom = try container.decodeDateTimeIfPresent(forKey: .validFrom)
        self.validThrough = try container.decodeDateTimeIfPresent(forKey: .validThrough)
        self.valueAddedTaxIncluded = try container.decodeIfPresent(Bool.self, forKey: .valueAddedTaxIncluded)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.eligibleQuantity, forKey: .eligibleQuantity)
        try container.encodeIfPresent(self.eligibleTransactionVolume, forKey: .eligibleTransactionVolume)
        try container.encodeIfPresent(self.maxPrice, forKey: .maxPrice)
        try container.encodeIfPresent(self.minPrice, forKey: .minPrice)
        try container.encodeIfPresent(self.price, forKey: .price)
        try container.encodeIfPresent(self.priceCurrency, forKey: .priceCurrency)
        try container.encodeIfPresent(self.validFrom, forKey: .validFrom)
        try container.encodeIfPresent(self.validThrough, forKey: .validThrough)
        try container.encodeIfPresent(self.valueAddedTaxIncluded, forKey: .valueAddedTaxIncluded)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: PriceSpecification?, forKey key: K) throws {
        if let typedValue = value as? SOPriceSpecification {
            try self.encode(typedValue, forKey: key)
        }
    }
}
