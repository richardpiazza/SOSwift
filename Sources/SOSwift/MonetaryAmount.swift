import Foundation

public class MonetaryAmount: Thing {
    
    /// The currency in which the monetary amount is expressed (in 3-letter
    /// ISO 4217 format).
    public var currency: String?
    
    /// The upper value of some characteristic or property.
    public var maxValue: Number?
    
    /// The lower value of some characteristic or property.
    public var minValue: Number?
    
    /// The date when the item becomes valid.
    public var validFrom: DateTime?
    
    /// The date after when the item is not valid. For example the end of an
    /// offer, salary period, or a period of opening hours.
    public var validThrough: DateTime?
    
    /// The value of the quantitative value or property value node.
    /// - note: For QuantitativeValue and MonetaryAmount, the recommended type
    ///         for values is 'Number'.
    /// - note: For PropertyValue, it can be 'Text;', 'Number', 'Boolean', or
    ///         'StructuredValue'.
    public var value: Value?
    
    internal enum MonetaryAmountCodingKeys: String, CodingKey {
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
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: MonetaryAmountCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MonetaryAmountCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}