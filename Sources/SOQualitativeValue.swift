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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOPropertyValue.self, forKey: .additionalProperty) {
            self.additionalProperty = value
        }
        if let value = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .equal) {
            self.equal = value
        }
        if let value = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .greater) {
            self.greater = value
        }
        if let value = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .greaterOrEqual) {
            self.greaterOrEqual = value
        }
        if let value = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .lesser) {
            self.lesser = value
        }
        if let value = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .lesserOrEqual) {
            self.lesserOrEqual = value
        }
        if let value = try container.decodeIfPresent(SOQualitativeValue.self, forKey: .nonEqual) {
            self.nonEqual = value
        }
        if let value = try container.decodeValueReferenceIfPresent(forKey: .valueReference) {
            self.valueReference = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.additionalProperty as? SOPropertyValue {
            try container.encode(value, forKey: .additionalProperty)
        }
        if let value = self.equal as? SOQualitativeValue {
            try container.encode(value, forKey: .equal)
        }
        if let value = self.greater as? SOQualitativeValue {
            try container.encode(value, forKey: .greater)
        }
        if let value = self.greaterOrEqual as? SOQualitativeValue {
            try container.encode(value, forKey: .greaterOrEqual)
        }
        if let value = self.lesser as? SOQualitativeValue {
            try container.encode(value, forKey: .lesser)
        }
        if let value = self.lesserOrEqual as? SOQualitativeValue {
            try container.encode(value, forKey: .lesserOrEqual)
        }
        if let value = self.nonEqual as? SOQualitativeValue {
            try container.encode(value, forKey: .nonEqual)
        }
        try container.encodeIfPresent(self.valueReference, forKey: .valueReference)
        
        try super.encode(to: encoder)
    }
}
