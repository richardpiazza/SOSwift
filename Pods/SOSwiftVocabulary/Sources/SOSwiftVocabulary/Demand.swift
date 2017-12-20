import Foundation

/// A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services.
/// For describing demand using this type, the very same properties used for Offer apply.
public protocol Demand: Intangible {
    /// The payment method(s) accepted by seller for this offer.
    var acceptedPaymentMethod: Any? { get set }
    /// The amount of time that is required between accepting the offer and the actual usage of the resource or service.
    var advanceBookingRequirement: QuantitativeValue? { get set }
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
    /// One or more detailed price specifications, indicating the unit price and delivery or payment charges.
    var priceSpecification: PriceSpecification? { get set }
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
