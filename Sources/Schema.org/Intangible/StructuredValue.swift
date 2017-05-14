import Foundation

public protocol StructuredValueConformance:
                    Value,
                    ValueReference
                {}

/// Structured values are used when the value of a property has a more complex structure than simply being a textual value or a reference to another thing.
public protocol StructuredValue: Intangible, StructuredValueConformance {
    
}
