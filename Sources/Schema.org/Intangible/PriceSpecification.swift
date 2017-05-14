import Foundation

public protocol PriceSpecificationConformance:
                    MonetaryAmountOrPriceSpecification
                {}

public protocol PriceSpecification: StructuredValue, PriceSpecificationConformance {
    var eligibleQuantity: QuantitativeValue? { get set }
    var eligibleTransactionVolume: PriceSpecification? { get set }
    var maxPrice: Number? { get set }
    var minPrice: Number? { get set }
    var price: NumberOrText? { get set }
    var priceCurrency: String? { get set }
    var validFrom: DateTime? { get set }
    var validThrough: DateTime? { get set }
    var valueAddedTaxIncluded: Bool? { get set }
}
