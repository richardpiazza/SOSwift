import Foundation

/// A property-value pair, e.g. representing a feature of a product or place.
///
/// Use the `name` property for the name of the property. If there is an additional
/// human-readable version of the value, put that into the `description` property.
///
/// Always use specific schema.org properties when a) they exist and b) you can
/// populate them. Using PropertyValue as a substitute will typically not trigger the
/// same effect as using the original, specific property.
public class PropertyValue: StructuredValue {

    /// The upper value of some characteristic or property.
    public var maxValue: Number?

    /// A technique or technology used corresponding to the method used for measuring the corresponding variable(s).
    ///
    /// See _MeasurementTechnique_ for more information.
    public var measurementTechnique: MeasurementTechnique?

    /// The lower value of some characteristic or property.
    public var minValue: Number?

    /// A commonly used identifier for the characteristic represented by the property,
    /// e.g. a manufacturer or a standard code for a property. propertyID can be (1)
    /// a prefixed string, mainly meant to be used with standards for product
    /// properties; (2) a site-specific, non-prefixed string (e.g. the primary key of the
    /// property or the vendor-specific id of the property), or (3) a URL indicating the
    /// type of the property, either pointing to an external vocabulary, or a Web
    /// resource that describes the property (e.g. a glossary entry). Standards
    /// bodies should promote a standard prefix for the identifiers of properties
    /// from their standards.
    public var propertyID: URLOrText?

    /// The unit of measurement given using the UN/CEFACT Common Code
    /// (3 characters) or a URL. Other codes than the UN/CEFACT Common Code
    /// may be used with a prefix followed by a colon.
    public var unitCode: URLOrText?

    /// A string or text indicating the unit of measurement. Useful if you cannot
    /// provide a standard unit code for unitCode.
    public var unitText: String?

    /// The value of the quantitative value or property value node.
    /// - For QuantitativeValue and MonetaryAmount, the recommended type for values is 'Number'.
    /// - For PropertyValue, it can be 'Text', 'Number', 'Boolean', or 'StructuredValue'.
    public var value: Value?

    /// A pointer to a secondary value that provides additional information on the original
    /// value, e.g. a reference temperature.
    public var valueReference: ValueReference?

    enum PropertyValueCodingKeys: String, CodingKey {
        case maxValue
        case measurementTechnique
        case minValue
        case propertyID
        case unitCode
        case unitText
        case value
        case valueReferences
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: PropertyValueCodingKeys.self)

        maxValue = try container.decodeIfPresent(Number.self, forKey: .maxValue)
        measurementTechnique = try container.decodeIfPresent(URLOrText.self, forKey: .measurementTechnique)
        minValue = try container.decodeIfPresent(Number.self, forKey: .minValue)
        propertyID = try container.decodeIfPresent(URLOrText.self, forKey: .propertyID)
        unitCode = try container.decodeIfPresent(URLOrText.self, forKey: .unitCode)
        unitText = try container.decodeIfPresent(String.self, forKey: .unitText)
        value = try container.decodeIfPresent(Value.self, forKey: .value)
        valueReference = try container.decodeIfPresent(ValueReference.self, forKey: .valueReferences)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PropertyValueCodingKeys.self)

        try container.encodeIfPresent(maxValue, forKey: .maxValue)
        try container.encodeIfPresent(measurementTechnique, forKey: .measurementTechnique)
        try container.encodeIfPresent(minValue, forKey: .minValue)
        try container.encodeIfPresent(propertyID, forKey: .propertyID)
        try container.encodeIfPresent(unitCode, forKey: .unitCode)
        try container.encodeIfPresent(unitText, forKey: .unitText)
        try container.encodeIfPresent(value, forKey: .value)
        try container.encodeIfPresent(valueReference, forKey: .valueReferences)

        try super.encode(to: encoder)
    }
}
