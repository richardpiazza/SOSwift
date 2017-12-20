import Foundation
import SOSwiftVocabulary

/// A predefined value for a product characteristic, e.g. the power cord plug type 'US' or the garment sizes 'S', 'M', 'L', and 'XL'.
public class SOQualitativeValue: SOEnumeration, QualitativeValue {
    
    public override class var type: String {
        return "QualitativeValue"
    }
    
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    public var additionalProperty: PropertyValue?
    /// This ordering relation for qualitative values indicates that the subject is equal to the object.
    public var equal: QualitativeValue?
    /// This ordering relation for qualitative values indicates that the subject is greater than the object.
    public var greater: QualitativeValue?
    /// This ordering relation for qualitative values indicates that the subject is greater than or equal to the object.
    public var greaterOrEqual: QualitativeValue?
    /// This ordering relation for qualitative values indicates that the subject is lesser than the object.
    public var lesser: QualitativeValue?
    /// This ordering relation for qualitative values indicates that the subject is lesser than or equal to the object.
    public var lesserOrEqual: QualitativeValue?
    /// This ordering relation for qualitative values indicates that the subject is not equal to the object.
    public var nonEqual: QualitativeValue?
    /// A pointer to a secondary value that provides additional information on the original value, e.g. a reference temperature.
    public var valueReference: ValueReference?
    
    private enum CodingKeys: String, CodingKey {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.additionalProperty = try container.decodeIfPresent(SOPropertyValue.self, forKey: .additionalProperty)
        self.equal = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .equal)
        self.greater = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .greater)
        self.greaterOrEqual = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .greaterOrEqual)
        self.lesser = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .lesser)
        self.lesserOrEqual = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .lesserOrEqual)
        self.nonEqual = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .nonEqual)
        self.valueReference = try container.decodeValueReferenceIfPresent(forKey: .valueReference)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.additionalProperty, forKey: .additionalProperty)
        try container.encodeIfPresent(self.equal, forKey: .equal)
        try container.encodeIfPresent(self.greater, forKey: .greater)
        try container.encodeIfPresent(self.greaterOrEqual, forKey: .greaterOrEqual)
        try container.encodeIfPresent(self.lesser, forKey: .lesser)
        try container.encodeIfPresent(self.lesserOrEqual, forKey: .lesserOrEqual)
        try container.encodeIfPresent(self.nonEqual, forKey: .nonEqual)
        try container.encodeIfPresent(self.valueReference, forKey: .valueReference)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: QualitativeValue?, forKey key: K) throws {
        if let typedValue = value as? SOQualitativeValue {
            try self.encode(typedValue, forKey: key)
        }
    }
}
