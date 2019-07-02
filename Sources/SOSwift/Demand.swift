import Foundation

/// A demand entity represents the public, not necessarily binding, not necessarily
/// exclusive, announcement by an organization or person to seek a certain type of
/// goods or services. For describing demand using this type, the very same
/// properties used for Offer apply.
public class Demand: Intangible {
    
    /// The payment method(s) accepted by seller for this offer.
    public var acceptedPaymentMethod: Any?
    
    /// The amount of time that is required between accepting the offer and the actual usage of the resource or service.
    public var advanceBookingRequirement: QuantitativeValue?
    
    /// The geographic area where a service or offered item is provided. Supersedes serviceArea.
    public var areaServed: AreaServed?
    
    /// The availability of this item—for example In stock, Out of stock, Pre-order, etc.
    public var availability: ItemAvailability?
    
    /// The end of the availability of the product or service included in the offer.
    public var availabilityEnds: DateTime?
    
    /// The beginning of the availability of the product or service included in the offer.
    public var availabilityStarts: DateTime?
    
    /// The place(s) from which the offer can be obtained (e.g. store locations).
    public var availableAtOrFrom: Place?
    
    /// The delivery method(s) available for this offer.
    public var availableDeliveryMethod: DeliveryMethod?
    
    /// The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.
    public var businessFunction: BusinessFunction?
    
    /// The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup.
    public var deliveryLeadTime: QuantitativeValue?
    
    /// The type(s) of customers for which the given offer is valid.
    public var eligibleCustomerType: BusinessEntityType?
    
    /// The duration for which the given offer is valid.
    public var eligibleDuration: QuantitativeValue?
    
    /// The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.
    public var eligibleQuantity: QuantitativeValue?
    
    /// The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.
    public var eligibleRegion: GeoShapeOrPlaceOrText?
    
    /// The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.
    public var eligibleTransactionVolume: PriceSpecification?
    
    /// The GTIN-12 code of the product, or the product to which the offer refers. The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items. See GS1 GTIN Summary for more details.
    public var gtin12: String?
    
    /// The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero. See GS1 GTIN Summary for more details.
    public var gtin13: String?
    
    /// The GTIN-14 code of the product, or the product to which the offer refers. See GS1 GTIN Summary for more details.
    public var gtin14: String?
    
    /// The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN. See GS1 GTIN Summary for more details.
    public var gtin8: String?
    
    /// This links to a node or nodes indicating the exact quantity of the products included in the offer.
    public var includesObject: TypeAndQuantityNode?
    
    /// The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is not valid, e.g. a region where the transaction is not allowed.
    public var ineligibleRegion: GeoShapeOrPlaceOrText?
    
    /// The current approximate inventory level for the item or items.
    public var inventoryLevel: QuantitativeValue?
    
    /// A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
    public var itemCondition: OfferItemCondition?
    
    /// The item being offered.
    public var itemOffered: ProductOrService?
    
    /// The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
    public var mpn: String?
    
    /// One or more detailed price specifications, indicating the unit price and delivery or payment charges.
    public var priceSpecification: PriceSpecification?
    
    /// An entity which offers (sells / leases / lends / loans) the services / goods. A seller may also be a provider. Supersedes merchant, vendor.
    public var seller: OrganizationOrPerson?
    
    /// The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.
    public var serialNumber: String?
    
    /// The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
    public var sku: String?
    
    /// The date when the item becomes valid.
    public var validFrom: DateTime?
    
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    public var validThrough: DateTime?
    
    /// The warranty promise(s) included in the offer. Supersedes warrantyPromise.
    public var warranty: WarrantyPromise?
    
    internal enum DemandCodingKeys: String, CodingKey {
        case acceptedPaymentMethod
        case advanceBookingRequirement
        case areaServed
        case availability
        case availabilityEnds
        case availabilityStarts
        case availableAtOrFrom
        case availableDeliveryMethod
        case businessFunction
        case deliveryLeadTime
        case eligibleCustomerType
        case eligibleDuration
        case eligibleQuantity
        case eligibleRegion
        case eligibleTransactionVolume
        case gtin12
        case gtin13
        case gtin14
        case gtin8
        case includesObject
        case ineligibleRegion
        case inventoryLevel
        case itemCondition
        case itemOffered
        case mpn
        case priceSpecification
        case seller
        case serialNumber
        case sku
        case validFrom
        case validThrough
        case warranty
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: DemandCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DemandCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }

}
