import Foundation

public protocol SchemaQualitativeValue: SchemaEnumeration {
    var additionalProperty: PropertyValue? { get set }
    var equal: SchemaQualitativeValue? { get set }
    var greater: SchemaQualitativeValue? { get set }
    var greaterOrEqual: SchemaQualitativeValue? { get set }
    var lesser: SchemaQualitativeValue? { get set }
    var lesserOrEqual: SchemaQualitativeValue? { get set }
    var nonEqual: SchemaQualitativeValue? { get set }
    var valueReference: ValueReference? { get set }
}
