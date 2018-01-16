import Foundation

/// An offer to transfer some rights to an item or to provide a service — for example, an offer to sell tickets to an event, to rent the DVD of a movie, to stream a TV show over the internet, to repair a motorcycle, or to loan a book.
public protocol Offer: Intangible {
    /// The payment method(s) accepted by seller for this offer.
    var acceptedPaymentMethod: Any? { get set }
    /// An additional offer that can only be obtained in combination with the first base offer (e.g. supplements and extensions that are available for a surcharge).
    var addOn: Offer? { get set }
    /// The amount of time that is required between accepting the offer and the actual usage of the resource or service.
    var advanceBookingRequirement: QuantitativeValue? { get set }
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    var aggregateRating: AggregateRating? { get set }
    /// The geographic area where a service or offered item is provided. Supersedes serviceArea.
    var areaServed: AreaServed? { get set }
    /// The availability of this item—for example In stock, Out of stock, Pre-order, etc.
    var availability: ItemAvailability? { get set }
    /// The end of the availability of the product or service included in the offer.
    var availabilityEnds: DateTime? { get set }
    /// The beginning of the availability of the product or service included in the offer.
    var availabilityStarts: DateTime? { get set }
    /// The place(s) from which the offer can be obtained (e.g. store locations).
    var availableAtOrFrom: Place? { get set }
    /// The delivery method(s) available for this offer.
    var availableDeliveryMethod: DeliveryMethod? { get set }
    /// The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.
    var businessFunction: BusinessFunction? { get set }
    /// A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.
    var category: PhysicalActivityCategoryOrThingOrText? { get set }
    /// The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup.
    var deliveryLeadTime: QuantitativeValue? { get set }
    /// The type(s) of customers for which the given offer is valid.
    var eligibleCustomerType: BusinessEntityType? { get set }
    /// The duration for which the given offer is valid.
    var eligibleDuration: QuantitativeValue? { get set }
    /// The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.
    var eligibleQuantity: QuantitativeValue? { get set }
    /// The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.
    var eligibleRegion: GeoShapeOrPlaceOrText? { get set }
    /// The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.
    var eligibleTransactionVolume: PriceSpecification? { get set }
    /// The GTIN-12 code of the product, or the product to which the offer refers. The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items. See GS1 GTIN Summary for more details.
    var gtin12: String? { get set }
    /// The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero. See GS1 GTIN Summary for more details.
    var gtin13: String? { get set }
    /// The GTIN-14 code of the product, or the product to which the offer refers. See GS1 GTIN Summary for more details.
    var gtin14: String? { get set }
    /// The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN. See GS1 GTIN Summary for more details.
    var gtin8: String? { get set }
    /// This links to a node or nodes indicating the exact quantity of the products included in the offer.
    var includesObject: TypeAndQuantityNode? { get set }
    /// The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is not valid, e.g. a region where the transaction is not allowed.
    var ineligibleRegion: GeoShapeOrPlaceOrText? { get set }
    /// The current approximate inventory level for the item or items.
    var inventoryLevel: QuantitativeValue? { get set }
    /// A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
    var itemCondition: OfferItemCondition? { get set }
    /// The item being offered.
    var itemOffered: ProductOrService? { get set }
    /// The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
    var mpn: String? { get set }
    /// A pointer to the organization or person making the offer.
    /// - Inverse property: makesOffer.
    var offeredBy: OrganizationOrPerson? { get set }
    /// The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes.
    /// Usage guidelines:
    /// Use the priceCurrency property (with ISO 4217 codes e.g. "USD") instead of including ambiguous symbols such as '$' in the value.
    /// Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator.
    /// Note that both RDFa and Microdata syntax allow the use of a "content=" attribute for publishing simple machine-readable values alongside more human-friendly formatting.
    /// Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similiar Unicode symbols.
    var price: NumberOrText? { get set }
    /// The currency (in 3-letter ISO 4217 format) of the price or a price component, when attached to PriceSpecification and its subtypes.
    var priceCurrency: String? { get set }
    /// One or more detailed price specifications, indicating the unit price and delivery or payment charges.
    var priceSpecification: PriceSpecification? { get set }
    /// The date after which the price is no longer available.
    var priceValidUntil: DateOnly? { get set }
    /// A review of the item. Supersedes reviews.
    /// - schema.org property name: review
    var reviews: [Review]? { get set }
    /// An entity which offers (sells / leases / lends / loans) the services / goods. A seller may also be a provider. Supersedes merchant, vendor.
    var seller: OrganizationOrPerson? { get set }
    /// The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.
    var serialNumber: String? { get set }
    /// The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
    var sku: String? { get set }
    /// The date when the item becomes valid.
    var validFrom: DateTime? { get set }
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    var validThrough: DateTime? { get set }
    /// The warranty promise(s) included in the offer. Supersedes warrantyPromise.
    var warranty: WarrantyPromise? { get set }
}
