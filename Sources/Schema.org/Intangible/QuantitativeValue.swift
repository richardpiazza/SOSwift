import Foundation

public protocol SchemaQuantitativeValue: StructuredValue, DistanceOrQuantitativeValue {
    var additionalProperty: PropertyValue? { get set }
    var maxValue: Number? { get set }
    var minValue: Number? { get set }
    var unitCode: TextOrURL? { get set }
    var unitText: String? { get set }
    var value: Value? { get set }
    var valueReference: ValueReference? { get set }
}
