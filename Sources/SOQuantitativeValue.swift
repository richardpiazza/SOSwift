import Foundation
import SOSwiftVocabulary

/// A point value or interval for product characteristics and other purposes.
public class SOQuantitativeValue: SOStructuredValue, QuantitativeValue {
    
    public override class var type: String {
        return "QuantitativeValue"
    }
    
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    public var additionalProperty: PropertyValue?
    /// The upper value of some characteristic or property.
    public var maxValue: Number?
    /// The lower value of some characteristic or property.
    public var minValue: Number?
    /// The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.
    public var unitCode: TextOrURL?
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOPropertyValue.self, forKey: .additionalProperty) {
            self.additionalProperty = value
        }
        if let value = try container.decodeNumberIfPresent(forKey: .maxValue) {
            self.maxValue = value
        }
        if let value = try container.decodeNumberIfPresent(forKey: .minValue) {
            self.minValue = value
        }
        if let value = try container.decodeTextOrURLIfPresent(forKey: .unitCode) {
            self.unitCode = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .unitText) {
            self.unitText = value
        }
        if let value = try container.decodeValueIfPresent(forKey: .value) {
            self.value = value
        }
        if let value = try container.decodeValueReferenceIfPresent(forKey: .valueReference) {
            self.valueReference = value
        }
        
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.additionalProperty as? SOPropertyValue {
            try container.encode(value, forKey: .additionalProperty)
        }
        if let value = self.maxValue {
            try container.encodeNumber(value, forKey: .maxValue)
        }
        if let value = self.minValue {
            try container.encodeNumber(value, forKey: .minValue)
        }
        if let value = self.unitCode {
            try container.encodeTextOrURL(value, forKey: .unitCode)
        }
        if let value = self.unitText {
            try container.encode(value, forKey: .unitText)
        }
        if let value = self.value {
            try container.encodeValue(value, forKey: .value)
        }
        if let value = self.valueReference {
            try container.encodeValueReference(value, forKey: .valueReference)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
