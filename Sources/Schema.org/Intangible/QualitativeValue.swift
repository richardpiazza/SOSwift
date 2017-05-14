import Foundation

/// A predefined value for a product characteristic, e.g. the power cord plug type 'US' or the garment sizes 'S', 'M', 'L', and 'XL'.
public protocol QualitativeValue: Enumeration {
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    var additionalProperty: PropertyValue? { get set }
    /// This ordering relation for qualitative values indicates that the subject is equal to the object.
    var equal: QualitativeValue? { get set }
    /// This ordering relation for qualitative values indicates that the subject is greater than the object.
    var greater: QualitativeValue? { get set }
    /// This ordering relation for qualitative values indicates that the subject is greater than or equal to the object.
    var greaterOrEqual: QualitativeValue? { get set }
    /// This ordering relation for qualitative values indicates that the subject is lesser than the object.
    var lesser: QualitativeValue? { get set }
    /// This ordering relation for qualitative values indicates that the subject is lesser than or equal to the object.
    var lesserOrEqual: QualitativeValue? { get set }
    /// This ordering relation for qualitative values indicates that the subject is not equal to the object.
    var nonEqual: QualitativeValue? { get set }
    /// A pointer to a secondary value that provides additional information on the original value, e.g. a reference temperature.
    var valueReference: ValueReference? { get set }
}
