import Foundation

public protocol PropertyValueConformance:
                    Identifier,
                    PropertyValueOrText
                {}

/// A property-value pair, e.g. representing a feature of a product or place.
/// Use the `name` property for the name of the property. If there is an additional human-readable version of the value, put that into the `description` property.
/// Always use specific schema.org properties when a) they exist and b) you can populate them. Using PropertyValue as a substitute will typically not trigger the same effect as using the original, specific property.
public protocol PropertyValue: StructuredValue, PropertyValueConformance {
    /// The upper value of some characteristic or property.
    var maxValue: Number? { get set }
    /// A technique or technology used in a Dataset (or DataDownload, DataCatalog), corresponding to the method used for measuring the corresponding variable(s) (described using variableMeasured). This is oriented towards scientific and scholarly dataset publication but may have broader applicability; it is not intended as a full representation of measurement, but rather as a high level summary for dataset discovery.
    /// For example, if variableMeasured is: molecule concentration, measurementTechnique could be: "mass spectrometry" or "nmr spectroscopy" or "colorimetry" or "immunofluorescence".
    /// If the variableMeasured is "depression rating", the measurementTechnique could be "Zung Scale" or "HAM-D" or "Beck Depression Inventory".
    ///If there are several variableMeasured properties recorded for some given data object, use a PropertyValue for each variableMeasured and attach the corresponding measurementTechnique.
    var measurementTechnique: URLOrText? { get set }
    /// The lower value of some characteristic or property.
    var minValue: Number? { get set }
    /// A commonly used identifier for the characteristic represented by the property, e.g. a manufacturer or a standard code for a property. propertyID can be (1) a prefixed string, mainly meant to be used with standards for product properties; (2) a site-specific, non-prefixed string (e.g. the primary key of the property or the vendor-specific id of the property), or (3) a URL indicating the type of the property, either pointing to an external vocabulary, or a Web resource that describes the property (e.g. a glossary entry). Standards bodies should promote a standard prefix for the identifiers of properties from their standards.
    var propertyID: URLOrText? { get set }
    /// The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.
    var unitCode: URLOrText? { get set }
    /// A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for unitCode.
    var unitText: String? { get set }
    /// The value of the quantitative value or property value node.
    /// - For QuantitativeValue and MonetaryAmount, the recommended type for values is 'Number'.
    /// - For PropertyValue, it can be 'Text;', 'Number', 'Boolean', or 'StructuredValue'.
    var value: Value? { get set }
    /// A pointer to a secondary value that provides additional information on the original value, e.g. a reference temperature.
    var valueReference: ValueReference? { get set }
}
