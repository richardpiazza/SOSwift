import Foundation

public protocol SchemaPriceSpecification: SchemaStructuredValue, SchemaMonetaryAmountOrPriceSpecification {
    var eligibleQuantity: SchemaQuantitativeValue? { get set }
    var eligibleTransactionVolume: SchemaPriceSpecification? { get set }
    var maxPrice: SchemaNumber? { get set }
    var minPrice: SchemaNumber? { get set }
    var price: SchemaNumberOrText? { get set }
    var priceCurrency: String? { get set }
    var validFrom: SchemaDateTime? { get set }
    var validThrough: SchemaDateTime? { get set }
    var valueAddedTaxIncluded: Bool? { get set }
}
