import Foundation

public protocol SchemaPriceSpecification: StructuredValue, MonetaryAmountOrPriceSpecification {
    var eligibleQuantity: SchemaQuantitativeValue? { get set }
    var eligibleTransactionVolume: SchemaPriceSpecification? { get set }
    var maxPrice: Number? { get set }
    var minPrice: Number? { get set }
    var price: NumberOrText? { get set }
    var priceCurrency: String? { get set }
    var validFrom: DateTime? { get set }
    var validThrough: DateTime? { get set }
    var valueAddedTaxIncluded: Bool? { get set }
}
