import Foundation
import SOSwiftVocabulary

/// A monetary value or range. This type can be used to describe an amount of money such as $50 USD, or a range as in describing a bank account being suitable for a balance between £1,000 and £1,000,000 GBP, or the value of a salary, etc. It is recommended to use PriceSpecification Types to describe the price of an Offer, Invoice, etc.
public class SOMonetaryAmount: SOThing, MonetaryAmount {
    
    public override class var type: String {
        return "MonetaryAmount"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
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
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
        self.maxValue = try container.decodeNumberIfPresent(forKey: .maxValue)
        self.minValue = try container.decodeNumberIfPresent(forKey: .minValue)
        self.validFrom = try container.decodeDateTimeIfPresent(forKey: .validFrom)
        self.validThrough = try container.decodeDateTimeIfPresent(forKey: .validThrough)
        self.value = try container.decodeValueIfPresent(forKey: .value)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.maxValue, forKey: .maxValue)
        try container.encodeIfPresent(self.minValue, forKey: .minValue)
        try container.encodeIfPresent(self.validFrom, forKey: .validFrom)
        try container.encodeIfPresent(self.validThrough, forKey: .validThrough)
        try container.encodeIfPresent(self.value, forKey: .value)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.currency.rawValue:
            return "The currency in which the monetary amount is expressed."
        case CodingKeys.maxValue.rawValue:
            return "The upper value of some characteristic or property."
        case CodingKeys.minValue.rawValue:
            return "The lower value of some characteristic or property."
        case CodingKeys.validFrom.rawValue:
            return "The date when the item becomes valid."
        case CodingKeys.validThrough.rawValue:
            return "The date after when the item is not valid."
        case CodingKeys.value.rawValue:
            return "The value of the quantitative value or property value node."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.currency.rawValue:
            self.currency = value as? String
        case CodingKeys.maxValue.rawValue:
            self.maxValue = value as? Number
        case CodingKeys.minValue.rawValue:
            self.minValue = value as? Number
        case CodingKeys.validFrom.rawValue:
            self.validFrom = value as? DateTime
        case CodingKeys.validThrough.rawValue:
            self.validThrough = value as? DateTime
        case CodingKeys.value.rawValue:
            self.value = value as? Value
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: MonetaryAmount?, forKey key: K) throws {
        if let typedValue = value as? SOMonetaryAmount {
            try self.encode(typedValue, forKey: key)
        }
    }
}
