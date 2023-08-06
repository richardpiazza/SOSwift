public typealias MonetaryAmountOrPriceSpecification = SingleSchemaConjunction<MonetaryAmount, PriceSpecification>

public extension MonetaryAmountOrPriceSpecification {
    var monetaryAmount: MonetaryAmount? { first }
    var priceSpecification: PriceSpecification? { second }
    
    static func monetaryAmount(value: MonetaryAmount) -> Self {
        .first(value)
    }
    
    static func priceSpecification(value: PriceSpecification) -> Self {
        .second(value)
    }
}
