import Foundation

/// A point value or interval for product characteristics and other purposes.
public class QuantitativeValue: StructuredValue {

    /// A property-value pair representing an additional characteristics of the entity.
    ///
    /// A product feature or another characteristic for which there is no matching property in schema.org.
    ///
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (
    ///         [http://schema.org/width](http://schema.org/width),
    ///         [http://schema.org/color](http://schema.org/color),
    ///         [http://schema.org/gtin13](http://schema.org/gtin13)
    ///         ) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    public var additionalProperty: PropertyValue?

    /// The upper value of some characteristic or property.
    public var maxValue: Number?

    /// The lower value of some characteristic or property.
    public var minValue: Number?

    /// The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL.
    ///
    /// Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.
    public var unitCode: URLOrText?

    /// A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for unitCode.
    public var unitText: String?

    /// The value of the quantitative value or property value node.
    ///
    /// - For QuantitativeValue and MonetaryAmount, the recommended type for values is 'Number'.
    /// - For PropertyValue, it can be 'Text;', 'Number', 'Boolean', or 'StructuredValue'.
    public var value: Value?

    /// A pointer to a secondary value that provides additional information on the original value
    ///
    /// ## For Example
    /// A reference temperature.
    public var valueReference: ValueReference?

    enum QuantitativeValueCodingKeys: String, CodingKey {
        case additionalProperty
        case maxValue
        case minValue
        case unitCode
        case unitText
        case value
        case valueReference
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: QuantitativeValueCodingKeys.self)

        additionalProperty = try container.decodeIfPresent(PropertyValue.self, forKey: .additionalProperty)
        maxValue = try container.decodeIfPresent(Number.self, forKey: .maxValue)
        minValue = try container.decodeIfPresent(Number.self, forKey: .minValue)
        unitCode = try container.decodeIfPresent(URLOrText.self, forKey: .unitText)
        unitText = try container.decodeIfPresent(String.self, forKey: .unitText)
        value = try container.decodeIfPresent(Value.self, forKey: .value)
        valueReference = try container.decodeIfPresent(ValueReference.self, forKey: .valueReference)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: QuantitativeValueCodingKeys.self)

        try container.encodeIfPresent(additionalProperty, forKey: .additionalProperty)
        try container.encodeIfPresent(maxValue, forKey: .maxValue)
        try container.encodeIfPresent(minValue, forKey: .minValue)
        try container.encodeIfPresent(unitCode, forKey: .unitCode)
        try container.encodeIfPresent(unitText, forKey: .unitText)
        try container.encodeIfPresent(value, forKey: .value)
        try container.encodeIfPresent(valueReference, forKey: .valueReference)

        try super.encode(to: encoder)
    }
}
