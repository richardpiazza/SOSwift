import Foundation

public protocol ProductConformance:
                    CreativeWorkOrProductOrURL,
                    ProductOrTextOrURL,
                    ProductOrService,
                    OwnershipInfoOrProduct,
                    ProductOrText
                {}

/// Any offered product or service.
/// - For Example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.
public protocol Product: Thing, ProductConformance {
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    var additionalProperty: PropertyValue? { get set }
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    var aggregateRating: AggregateRating? { get set }
    /// An intended audience, i.e. a group for whom something was created.
    var audience: Audience? { get set }
    /// An award won by or for this item.
    var award: String? { get set }
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    var brand: BrandOrOrganization? { get set }
    /// A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.
    var category: TextOrThing? { get set }
    /// The color of the product.
    var color: String? { get set }
    /// The depth of the item.
    var depth: DistanceOrQuantitativeValue? { get set }
    /// The GTIN-12 code of the product, or the product to which the offer refers.
    /// The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items.
    var gtin12: String? { get set }
    /// The GTIN-13 code of the product, or the product to which the offer refers.
    /// This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero.
    var gtin13: String? { get set }
    /// The GTIN-14 code of the product, or the product to which the offer refers.
    var gtin14: String? { get set }
    /// The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN.
    var gtin8: String? { get set }
    /// The height of the item.
    var height: DistanceOrQuantitativeValue? { get set }
    /// A pointer to another product (or multiple products) for which this product is an accessory or spare part.
    var isAccessoryOrSparePartFor: Product? { get set }
    /// A pointer to another product (or multiple products) for which this product is a consumable.
    var isConsumableFor: Product? { get set }
    /// A pointer to another, somehow related product (or multiple products).
    var isRelatedTo: ProductOrService? { get set }
    /// A pointer to another, functionally similar product (or multiple products).
    var isSimilarTo: ProductOrService? { get set }
    /// A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
    var itemCondition: OfferItemCondition? { get set }
    /// An associated logo.
    var logo: ImageObjectOrURL? { get set }
    /// The manufacturer of the product.
    var manufacturer: Organization? { get set }
    /// A material that something is made from, e.g. leather, wool, cotton, paper.
    var material: ProductOrTextOrURL? { get set }
    /// The model of the product. Use with the URL of a ProductModel or a textual representation of the model identifier. The URL of the ProductModel can be from an external source. It is recommended to additionally provide strong product identifiers via the gtin8/gtin13/gtin14 and mpn properties.
    var model: ProductModelOrText? { get set }
    /// The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
    var mpn: String? { get set }
    /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event.
    var offers: [Offer]? { get set }
    /// The product identifier, such as ISBN. For example: meta itemprop="productID" content="isbn:123-456-789".
    var productID: String? { get set }
    /// The date of production of the item, e.g. vehicle.
    var productionDate: DateOnly? { get set }
    /// The date the item e.g. vehicle was purchased by the current owner.
    var purchaseDate: DateOnly? { get set }
    /// The release date of a product or product model. This can be used to distinguish the exact variant of a product.
    var releaseDate: DateOnly? { get set }
    /// A review of the item.
    var review: Review? { get set }
    /// The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
    var sku: String? { get set }
    /// The weight of the product or person.
    var weight: QuantitativeValue? { get set }
    /// The width of the item.
    var width: DistanceOrQuantitativeValue? { get set }
}
