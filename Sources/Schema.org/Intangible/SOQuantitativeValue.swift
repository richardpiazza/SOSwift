import Foundation

public protocol SchemaQuantitativeValue: SchemaStructuredValue, SchemaDistanceOrQuantitativeValue {
    var additionalProperty: SchemaPropertyValue? { get set }
    var maxValue: SchemaNumber? { get set }
    var minValue: SchemaNumber? { get set }
    var unitCode: SchemaTextOrURL? { get set }
    var unitText: String? { get set }
    var value: SchemaBooleanOrNumberOrStructuredValueOrText? { get set }
    var valueReference: SchemaEnumerationOrPropertyValueOrQualitativeValueOrQuantitativeValueOrStructuredValue? { get set }
}
