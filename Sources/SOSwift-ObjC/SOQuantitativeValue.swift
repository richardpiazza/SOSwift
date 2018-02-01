import Foundation
import SOSwiftVocabulary_ObjC

/// A point value or interval for product characteristics and other purposes.
public class SOQuantitativeValue: SOStructuredValue, QuantitativeValue {
    
    public override class var type: String {
        return "QuantitativeValue"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    public var additionalProperty: PropertyValue?
    /// The upper value of some characteristic or property.
    public var maxValue: Number?
    /// The lower value of some characteristic or property.
    public var minValue: Number?
    /// The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.
    public var unitCode: URLOrText?
    /// A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for unitCode.
    public var unitText: String?
    /// The value of the quantitative value or property value node.
    /// - For QuantitativeValue and MonetaryAmount, the recommended type for values is 'Number'.
    /// - For PropertyValue, it can be 'Text;', 'Number', 'Boolean', or 'StructuredValue'.
    public var value: Value?
    /// A pointer to a secondary value that provides additional information on the original value, e.g. a reference temperature.
    public var valueReference: ValueReference?
    
    private enum CodingKeys: String, CodingKey {
        case additionalProperty
        case maxValue
        case minValue
        case unitCode
        case unitText
        case value
        case valueReference
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.additionalProperty = try container.decodeIfPresent(SOPropertyValue.self, forKey: .additionalProperty)
        self.maxValue = try container.decodeNumberIfPresent(forKey: .maxValue)
        self.minValue = try container.decodeNumberIfPresent(forKey: .minValue)
        self.unitCode = try container.decodeURLOrTextIfPresent(forKey: .unitCode)
        self.unitText = try container.decodeIfPresent(String.self, forKey: .unitText)
        self.value = try container.decodeValueIfPresent(forKey: .value)
        self.valueReference = try container.decodeValueReferenceIfPresent(forKey: .valueReference)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.additionalProperty, forKey: .additionalProperty)
        try container.encodeIfPresent(self.maxValue, forKey: .maxValue)
        try container.encodeIfPresent(self.minValue, forKey: .minValue)
        try container.encodeIfPresent(self.unitCode, forKey: .unitCode)
        try container.encodeIfPresent(self.unitText, forKey: .unitText)
        try container.encodeIfPresent(self.value, forKey: .value)
        try container.encodeIfPresent(self.valueReference, forKey: .valueReference)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: QuantitativeValue?, forKey key: K) throws {
        if let typedValue = value as? SOQuantitativeValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}
