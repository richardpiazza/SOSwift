import Foundation

/// Enumeration, PropertyValue, QualitativeValue, QuantitativeValue, StructuredValue
public protocol ValueReference {}

public extension ValueReference {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Enumeration {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? StructuredValue {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
