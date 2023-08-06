public typealias MonetaryAmountOrNumber = SingleSchemaCodableConjunction<MonetaryAmount, Number>

public extension MonetaryAmountOrNumber {
    var monetaryAmount: MonetaryAmount? { first }
    var number: Number? { second }
}
