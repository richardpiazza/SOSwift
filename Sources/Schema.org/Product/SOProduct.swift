import Foundation

public protocol SchemaProductDataTypeConformance:
                    SchemaCreativeWorkOrProductOrURL,
                    SchemaProductOrTextOrURL,
                    SchemaProductOrService,
                    SchemaOwnershipInfoOrProduct
                {}

public protocol SchemaProduct: SchemaThing, SchemaProductDataTypeConformance {
    var additionalProperty: SchemaPropertyValue? { get set }
    var aggregateRating: SchemaAggregateRating? { get set }
    var audience: SchemaAudience? { get set }
    var award: String? { get set }
    var brand: SchemaBrandOrOrganization? { get set }
    var category: SchemaTextOrThing? { get set }
    var color: String? { get set }
    var depth: SchemaDistanceOrQuantitativeValue? { get set }
    var gtin12: String? { get set }
    var gtin13: String? { get set }
    var gtin14: String? { get set }
    var gtin8: String? { get set }
    var height: SchemaDistanceOrQuantitativeValue? { get set }
    var isAccessoryOrSparePartFor: SchemaProduct? { get set }
    var isConsumableFor: SchemaProduct? { get set }
    var isRelatedTo: SchemaProductOrService? { get set }
    var isSimilarTo: SchemaProductOrService? { get set }
    var itemCondition: OfferItemCondition? { get set }
    var logo: SchemaImageObjectOrURL? { get set }
    var manufacturer: SchemaOrganization? { get set }
    var material: SchemaProductOrTextOrURL? { get set }
    var model: SchemaProductModelOrText? { get set }
    var mpn: String? { get set }
    var offers: [SchemaOffer]? { get set }
    var productID: String? { get set }
    var productionDte: SchemaDate? { get set }
    var purchaseDate: SchemaDate? { get set }
    var releaseDate: SchemaDate? { get set }
    var review: SchemaReview? { get set }
    var sku: String? { get set }
    var weight: SchemaQuantitativeValue? { get set }
    var width: SchemaDistanceOrQuantitativeValue? { get set }
}
