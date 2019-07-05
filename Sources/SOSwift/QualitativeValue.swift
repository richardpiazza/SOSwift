import Foundation

/// A predefined value for a product characteristic, e.g. the power cord plug type
/// 'US' or the garment sizes 'S', 'M', 'L', and 'XL'.
public class QualitativeValue: Enumeration {
    
    /// A property-value pair representing an additional characteristics of the entitity,
    /// e.g. a product feature or another characteristic for which there is no
    /// matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use
    ///         specific schema.org properties (e.g. http://schema.org/width,
    ///         http://schema.org/color, http://schema.org/gtin13, ...)
    ///         will typically expect such data to be provided using those properties,
    ///         rather than using the generic property/value mechanism.
    public var additionalProperty: PropertyValue?
    
    /// This ordering relation for qualitative values indicates that the subject
    /// is equal to the object.
    public var equal: QualitativeValue?
    
    /// This ordering relation for qualitative values indicates that the subject is
    /// greater than the object.
    public var greater: QualitativeValue?
    
    /// This ordering relation for qualitative values indicates that the subject is
    /// greater than or equal to the object.
    public var greaterOrEqual: QualitativeValue?
    
    /// This ordering relation for qualitative values indicates that the subject is
    /// lesser than the object.
    public var lesser: QualitativeValue?
    
    /// This ordering relation for qualitative values indicates that the subject is
    /// lesser than or equal to the object.
    public var lesserOrEqual: QualitativeValue?
    
    /// This ordering relation for qualitative values indicates that the subject is
    /// not equal to the object.
    public var nonEqual: QualitativeValue?
    
    /// A pointer to a secondary value that provides additional information on the
    /// original value, e.g. a reference temperature.
    public var valueReference: ValueReference?
    
    internal enum QualitativeValueCodingKeys: String, CodingKey {
        case additionalProperty
        case equal
        case greater
        case greaterOrEqual
        case lesser
        case lesserOrEqual
        case nonEqual
        case valueReference
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: QualitativeValueCodingKeys.self)
        
        additionalProperty = try container.decodeIfPresent(PropertyValue.self, forKey: .additionalProperty)
        equal = try container.decodeIfPresent(QualitativeValue.self, forKey: .equal)
        greater = try container.decodeIfPresent(QualitativeValue.self, forKey: .greater)
        greaterOrEqual = try container.decodeIfPresent(QualitativeValue.self, forKey: .greaterOrEqual)
        lesser = try container.decodeIfPresent(QualitativeValue.self, forKey: .lesser)
        lesserOrEqual = try container.decodeIfPresent(QualitativeValue.self, forKey: .lesserOrEqual)
        nonEqual = try container.decodeIfPresent(QualitativeValue.self, forKey: .nonEqual)
        valueReference = try container.decodeIfPresent(ValueReference.self, forKey: .valueReference)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: QualitativeValueCodingKeys.self)
        
        try container.encodeIfPresent(additionalProperty, forKey: .additionalProperty)
        try container.encodeIfPresent(equal, forKey: .equal)
        try container.encodeIfPresent(greater, forKey: .greater)
        try container.encodeIfPresent(greaterOrEqual, forKey: .greaterOrEqual)
        try container.encodeIfPresent(lesser, forKey: .lesser)
        try container.encodeIfPresent(lesserOrEqual, forKey: .lesserOrEqual)
        try container.encodeIfPresent(nonEqual, forKey: .nonEqual)
        try container.encodeIfPresent(valueReference, forKey: .valueReference)
        
        try super.encode(to: encoder)
    }
}
