import Foundation

/// A property-value pair, e.g. representing a feature of a product or place.
/// Use the `name` property for the name of the property. If there is an additional human-readable version of the value, put that into the `description` property.
/// Always use specific schema.org properties when a) they exist and b) you can populate them. Using PropertyValue as a substitute will typically not trigger the same effect as using the original, specific property.
public class SOPropertyValue: SOStructuredValue, PropertyValue {
    public struct Keys {
        public static let maxValue = "maxValue"
        public static let minValue = "minValue"
        public static let propertyID = "propertyID"
        public static let unitCode = "unitCode"
        public static let unitText = "unitText"
        public static let value = "value"
        public static let valueReference = "valueReference"
    }
    
    override public class var type: String {
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.maxValue] {
            self.maxValue = makeNumber(anyObject: value)
        }
        if let value = dictionary[Keys.minValue] {
            self.minValue = makeNumber(anyObject: value)
        }
        if let value = dictionary[Keys.propertyID] {
            self.propertyID = makeTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.unitCode] {
            self.unitCode = makeTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.unitText] as? String {
            self.unitText = value
        }
        if let value = dictionary[Keys.value] {
            self.value = makeValue(anyObject: value)
        }
        if let value = dictionary[Keys.valueReference] {
            self.valueReference = makeValueReference(anyObject: value)
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.maxValue?.dictionaryValue {
            dictionary[Keys.maxValue] = value
        }
        if let value = self.minValue?.dictionaryValue {
            dictionary[Keys.minValue] = value
        }
        if let value = self.propertyID?.dictionaryValue {
            dictionary[Keys.propertyID] = value
        }
        if let value = self.unitCode?.dictionaryValue {
            dictionary[Keys.unitCode] = value
        }
        if let value = self.unitText {
            dictionary[Keys.unitText] = value as AnyObject
        }
        if let value = self.value?.dictionaryValue {
            dictionary[Keys.value] = value
        }
        if let value = self.valueReference?.dictionaryValue {
            dictionary[Keys.valueReference] = value
        }
        return dictionary
    }
}
