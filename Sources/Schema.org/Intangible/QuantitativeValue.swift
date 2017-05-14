import Foundation

public protocol QuantitativeValueConformance:
                    DistanceOrQuantitativeValue
                {}

/// A point value or interval for product characteristics and other purposes.
public protocol QuantitativeValue: StructuredValue, QuantitativeValueConformance {
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    var additionalProperty: PropertyValue? { get set }
    /// The upper value of some characteristic or property.
    var maxValue: Number? { get set }
    /// The lower value of some characteristic or property.
    var minValue: Number? { get set }
    /// The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.
    var unitCode: TextOrURL? { get set }
    /// A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for unitCode.
    var unitText: String? { get set }
    /// The value of the quantitative value or property value node.
    /// - For QuantitativeValue and MonetaryAmount, the recommended type for values is 'Number'.
    /// - For PropertyValue, it can be 'Text;', 'Number', 'Boolean', or 'StructuredValue'.
    var value: Value? { get set }
    /// A pointer to a secondary value that provides additional information on the original value, e.g. a reference temperature.
    var valueReference: ValueReference? { get set }
}
