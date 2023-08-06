public typealias DistanceOrQuantitativeValue = SingleSchemaConjunction<Distance, QuantitativeValue>

public extension DistanceOrQuantitativeValue {
    var distance: Distance? { first }
    var quantitativeValue: QuantitativeValue? { second }
    
    static func distance(value: Distance) -> Self {
        .first(value)
    }
    
    static func quantitativeValue(value: QuantitativeValue) -> Self {
        .second(value)
    }
}
