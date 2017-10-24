import Foundation
import SOSwiftVocabulary

/// A property-value pair, e.g. representing a feature of a product or place.
/// Use the `name` property for the name of the property. If there is an additional human-readable version of the value, put that into the `description` property.
/// Always use specific schema.org properties when a) they exist and b) you can populate them. Using PropertyValue as a substitute will typically not trigger the same effect as using the original, specific property.
public class SOPropertyValue: SOStructuredValue, PropertyValue {
    
    public override class var type: String {
        return "PropertyValue"
    }
    
    /// The upper value of some characteristic or property.
    public var maxValue: Number?
    /// The lower value of some characteristic or property.
    public var minValue: Number?
    /// A commonly used identifier for the characteristic represented by the property, e.g. a manufacturer or a standard code for a property. propertyID can be (1) a prefixed string, mainly meant to be used with standards for product properties; (2) a site-specific, non-prefixed string (e.g. the primary key of the property or the vendor-specific id of the property), or (3) a URL indicating the type of the property, either pointing to an external vocabulary, or a Web resource that describes the property (e.g. a glossary entry). Standards bodies should promote a standard prefix for the identifiers of properties from their standards.
    public var propertyID: TextOrURL?
    /// The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.
    public var unitCode: TextOrURL?
    /// A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for unitCode.
    public var unitText: String?
    /// The value of the quantitative value or property value node.
    /// - For QuantitativeValue and MonetaryAmount, the recommended type for values is 'Number'.
    /// - For PropertyValue, it can be 'Text', 'Number', 'Boolean', or 'StructuredValue'.
    public var value: Value?
    /// A pointer to a secondary value that provides additional information on the original value, e.g. a reference temperature.
    public var valueReference: ValueReference?
    
    private enum CodingKeys: String, CodingKey {
        case maxValue
        case minValue
        case propertyID
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
        
        self.maxValue = try container.decodeNumberIfPresent(forKey: .maxValue)
        self.minValue = try container.decodeNumberIfPresent(forKey: .minValue)
        self.propertyID = try container.decodeTextOrURLIfPresent(forKey: .propertyID)
        self.unitCode = try container.decodeTextOrURLIfPresent(forKey: .unitCode)
        self.unitText = try container.decodeIfPresent(String.self, forKey: .unitText)
        self.value = try container.decodeValueIfPresent(forKey: .value)
        self.valueReference = try container.decodeValueReferenceIfPresent(forKey: .valueReference)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.maxValue, forKey: .maxValue)
        try container.encodeIfPresent(self.minValue, forKey: .minValue)
        try container.encodeIfPresent(self.propertyID, forKey: .propertyID)
        try container.encodeIfPresent(self.unitCode, forKey: .unitCode)
        try container.encodeIfPresent(self.unitText, forKey: .unitText)
        try container.encodeIfPresent(self.value, forKey: .value)
        try container.encodeIfPresent(self.valueReference, forKey: .valueReference)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: PropertyValue?, forKey key: K) throws {
        if let typedValue = value as? SOPropertyValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}
