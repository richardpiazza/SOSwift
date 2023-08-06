public typealias QuantitativeValueOrNumber = SingleSchemaCodableConjunction<QuantitativeValue, Number>

public extension QuantitativeValueOrNumber {
    var quantitativeValue: QuantitativeValue? { first }
    var number: Number? { second }
}
