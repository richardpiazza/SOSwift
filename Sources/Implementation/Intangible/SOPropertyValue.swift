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
            if let typedValue = value as? Int {
                self.maxValue = typedValue
            } else if let typedValue = value as? Float {
                self.maxValue = typedValue
            }
        }
        if let value = dictionary[Keys.minValue] {
            if let typedValue = value as? Int {
                self.minValue = typedValue
            } else if let typedValue = value as? Float {
                self.minValue = typedValue
            }
        }
        if let value = dictionary[Keys.propertyID] {
            if let typedValue = value as? String, typedValue.contains("://") {
                self.propertyID = URL(string: typedValue)
            } else if let typedValue = value as? String {
                self.propertyID = typedValue
            }
        }
        if let value = dictionary[Keys.unitCode] {
            if let typedValue = value as? String, typedValue.contains("://") {
                self.unitCode = URL(string: typedValue)
            } else if let typedValue = value as? String {
                self.unitCode = typedValue
            }
        }
        if let value = dictionary[Keys.unitText] as? String {
            self.unitText = value
        }
        if let value = dictionary[Keys.value] {
            if let typedValue = value as? [String : AnyObject], let typeName = typedValue[SOThing.Keys.type] as? String {
                for typeClass in SOStructuredValue.specificTypes {
                    if typeClass.type == typeName {
                        self.value = typeClass.initialize(dictionary: typedValue) as? Value
                    }
                }
            } else if let typedValue = value as? Float {
                self.value = typedValue
            } else if let typedValue = value as? Int {
                self.value = typedValue
            } else if let typedValue = value as? Bool {
                self.value = typedValue
            } else if let typedValue = value as? String {
                self.value = typedValue
            }
        }
        if let value = dictionary[Keys.valueReference] {
            if let typedValue = value as? [String : AnyObject], let typeName = typedValue[SOThing.Keys.type] as? String {
                for typeClass in SOStructuredValue.specificTypes {
                    if typeClass.type == typeName {
                        self.valueReference = typeClass.initialize(dictionary: typedValue) as? ValueReference
                    }
                }
                for typeClass in Enumeration.specificTypes {
                    if typeClass.type == typeName {
                        self.valueReference = typeClass.initialize(dictionary: typedValue) as? ValueReference
                    }
                }
            }
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.maxValue {
            if let typedValue = value as? Int {
                dictionary[Keys.maxValue] = typedValue as AnyObject
            } else if let typedValue = value as? Float {
                dictionary[Keys.maxValue] = typedValue as AnyObject
            }
        }
        if let value = self.minValue {
            if let typedValue = value as? Int {
                dictionary[Keys.minValue] = typedValue as AnyObject
            } else if let typedValue = value as? Float {
                dictionary[Keys.minValue] = typedValue as AnyObject
            }
        }
        if let value = self.propertyID {
            if let typedValue = value as? URL {
                dictionary[Keys.propertyID] = typedValue.absoluteString as AnyObject
            } else if let typedValue = value as? String {
                dictionary[Keys.propertyID] = typedValue as AnyObject
            }
        }
        if let value = self.unitCode {
            if let typedValue = value as? URL {
                dictionary[Keys.unitCode] = typedValue.absoluteString as AnyObject
            } else if let typedValue = value as? String {
                dictionary[Keys.unitCode] = typedValue as AnyObject
            }
        }
        if let value = self.unitText {
            dictionary[Keys.unitText] = value as AnyObject
        }
        if let value = self.value {
            if let typedValue = value as? String {
                dictionary[Keys.value] = typedValue as AnyObject
            } else if let typedValue = value as? Bool {
                dictionary[Keys.value] = typedValue as AnyObject
            } else if let typedValue = value as? Float {
                dictionary[Keys.value] = typedValue as AnyObject
            } else if let typedValue = value as? Int {
                dictionary[Keys.value] = typedValue as AnyObject
            } else if let typedValue = value as? SOStructuredValue {
                dictionary[Keys.value] = typedValue.dictionary as AnyObject
            }
        }
        if let value = self.valueReference {
            if let typedValue = value as? Enumeration {
                dictionary[Keys.valueReference] = typedValue.dictionary as AnyObject
            } else if let typedValue = value as? SOStructuredValue {
                dictionary[Keys.valueReference] = typedValue.dictionary as AnyObject
            }
        }
        return dictionary
    }
}
