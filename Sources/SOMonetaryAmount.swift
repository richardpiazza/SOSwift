import Foundation
import SOSwiftVocabulary

/// A monetary value or range. This type can be used to describe an amount of money such as $50 USD, or a range as in describing a bank account being suitable for a balance between £1,000 and £1,000,000 GBP, or the value of a salary, etc. It is recommended to use PriceSpecification Types to describe the price of an Offer, Invoice, etc.
public class SOMonetaryAmount: SOThing, MonetaryAmount {
    
    public override class var type: String {
        return "MonetaryAmount"
    }
    
    /// The currency in which the monetary amount is expressed (in 3-letter ISO 4217 format).
    public var currency: String?
    /// The upper value of some characteristic or property.
    public var maxValue: Number?
    /// The lower value of some characteristic or property.
    public var minValue: Number?
    /// The date when the item becomes valid.
    public var validFrom: DateTime?
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    public var validThrough: DateTime?
    /// The value of the quantitative value or property value node.
    /// - For QuantitativeValue and MonetaryAmount, the recommended type for values is 'Number'.
    /// - For PropertyValue, it can be 'Text;', 'Number', 'Boolean', or 'StructuredValue'.
    public var value: Value?
    
    private enum CodingKeys: String, CodingKey {
        case currency
        case maxValue
        case minValue
        case validFrom
        case validThrough
        case value
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .currency) {
            self.currency = value
        }
        if let value = try container.decodeNumberIfPresent(forKey: .maxValue) {
            self.maxValue = value
        }
        if let value = try container.decodeNumberIfPresent(forKey: .minValue) {
            self.minValue = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .validFrom) {
            self.validFrom = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .validThrough) {
            self.validThrough = value
        }
        if let value = try container.decodeValueIfPresent(forKey: .value) {
            self.value = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.currency {
            try container.encode(value, forKey: .currency)
        }
        if let value = self.maxValue {
            try container.encodeNumber(value, forKey: .maxValue)
        }
        if let value = self.minValue {
            try container.encodeNumber(value, forKey: .minValue)
        }
        if let value = self.validFrom {
            try container.encodeDateTime(value, forKey: .validFrom)
        }
        if let value = self.validThrough {
            try container.encodeDateTime(value, forKey: .validThrough)
        }
        if let value = self.value {
            try container.encodeValue(value, forKey: .value)
        }
        
        try super.encode(to: encoder)
    }
}
