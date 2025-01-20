import CodablePlus
import Foundation

public typealias ValueReference = EnumerationOrPropertyValueOrQualitativeValueOrQuantitativeValueOrStructuredValue

public typealias EnumerationOrPropertyValueOrQualitativeValueOrQuantitativeValueOrStructuredValue =
    QuadrupleSchemaConjunction<Enumeration, PropertyValue, QualitativeValue, QuantitativeValue, StructuredValue>

public extension EnumerationOrPropertyValueOrQualitativeValueOrQuantitativeValueOrStructuredValue {
    var enumeration: Enumeration? { first }
    var propertyValue: PropertyValue? { second }
    var qualitativeValue: QualitativeValue? { third }
    var quantitativeValue: QuantitativeValue? { fourth }
    var structuredValue: StructuredValue? { fifth }
}
