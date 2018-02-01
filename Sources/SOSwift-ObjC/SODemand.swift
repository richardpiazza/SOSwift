import Foundation
import SOSwiftVocabulary_ObjC

/// A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services. For describing demand using this type, the very same properties used for Offer apply.
public class SODemand: SOIntangible, Demand {
    
    public override class var type: String {
        return "Demand"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The payment method(s) accepted by seller for this offer.
    public var acceptedPaymentMethod: Any?
    /// The amount of time that is required between accepting the offer and the actual usage of the resource or service.
    public var advanceBookingRequirement: QuantitativeValue?
    /// The geographic area where a service or offered item is provided. Supersedes serviceArea.
    public var areaServed: AreaServed?
    /// The availability of this item—for example In stock, Out of stock, Pre-order, etc.
    public var availabilityRawValue: NSNumber?
    /// The end of the availability of the product or service included in the offer.
    public var availabilityEnds: DateTime?
    /// The beginning of the availability of the product or service included in the offer.
    public var availabilityStarts: DateTime?
    /// The place(s) from which the offer can be obtained (e.g. store locations).
    public var availableAtOrFrom: Place?
    /// The delivery method(s) available for this offer.
    public var availableDeliveryMethodRawValue: NSNumber?
    /// The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.
    public var businessFunctionRawValue: NSNumber?
    /// The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup.
    public var deliveryLeadTime: QuantitativeValue?
    /// The type(s) of customers for which the given offer is valid.
    public var eligibleCustomerTypeRawValue: NSNumber?
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
    public var itemConditionRawValue: NSNumber?
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
    
    private enum CodingKeys: String, CodingKey {
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
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.advanceBookingRequirement = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .advanceBookingRequirement)
        self.areaServed = try container.decodeAreaServedIfPresent(forKey: .areaServed)
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .availability) {
            self.availability = ItemAvailability(stringValue: rawValue)
        }
        self.availabilityEnds = try container.decodeDateTimeIfPresent(forKey: .availabilityEnds)
        self.availabilityStarts = try container.decodeDateTimeIfPresent(forKey: .availabilityStarts)
        self.availableAtOrFrom = try container.decodeIfPresent(SOPlace.self, forKey: .availableAtOrFrom)
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .availableDeliveryMethod) {
            self.availableDeliveryMethod = DeliveryMethod(stringValue: rawValue)
        }
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .businessFunction) {
            self.businessFunction = BusinessFunction(stringValue: rawValue)
        }
        self.deliveryLeadTime = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .deliveryLeadTime)
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .eligibleCustomerType) {
            self.eligibleCustomerType = BusinessEntityType(stringValue: rawValue)
        }
        self.eligibleDuration = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .eligibleDuration)
        self.eligibleQuantity = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .eligibleQuantity)
        self.eligibleTransactionVolume = try container.decodeIfPresent(SOPriceSpecification.self, forKey: .eligibleTransactionVolume)
        self.gtin12 = try container.decodeIfPresent(String.self, forKey: .gtin12)
        self.gtin13 = try container.decodeIfPresent(String.self, forKey: .gtin13)
        self.gtin14 = try container.decodeIfPresent(String.self, forKey: .gtin14)
        self.gtin8 = try container.decodeIfPresent(String.self, forKey: .gtin8)
        self.includesObject = try container.decodeIfPresent(SOTypeAndQuantityNode.self, forKey: .includesObject)
        self.inventoryLevel = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .inventoryLevel)
        if let rawValue = try container.decodeIfPresent(String.self, forKey: .itemCondition) {
            self.itemCondition = OfferItemCondition(stringValue: rawValue)
        }
        self.itemOffered = try container.decodeProductOrServiceIfPresent(forKey: .itemOffered)
        self.mpn = try container.decodeIfPresent(String.self, forKey: .mpn)
        self.priceSpecification = try container.decodeIfPresent(SOPriceSpecification.self, forKey: .priceSpecification)
        self.seller = try container.decodeOrganizationOrPersonIfPresent(forKey: .seller)
        self.serialNumber = try container.decodeIfPresent(String.self, forKey: .serialNumber)
        self.sku = try container.decodeIfPresent(String.self, forKey: .sku)
        self.validFrom = try container.decodeDateTimeIfPresent(forKey: .validFrom)
        self.validThrough = try container.decodeDateTimeIfPresent(forKey: .validThrough)
        self.warranty = try container.decodeIfPresent(SOWarrantyPromise.self, forKey: .warranty)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.advanceBookingRequirement, forKey: .advanceBookingRequirement)
        try container.encodeIfPresent(self.areaServed, forKey: .areaServed)
        try container.encodeIfPresent(self.availability?.stringValue, forKey: .availability)
        try container.encodeIfPresent(self.availabilityEnds, forKey: .availabilityEnds)
        try container.encodeIfPresent(self.availabilityStarts, forKey: .availabilityStarts)
        try container.encodeIfPresent(self.availableAtOrFrom, forKey: .availableAtOrFrom)
        try container.encodeIfPresent(self.availableDeliveryMethod?.stringValue, forKey: .availableDeliveryMethod)
        try container.encodeIfPresent(self.businessFunction?.stringValue, forKey: .businessFunction)
        try container.encodeIfPresent(self.deliveryLeadTime, forKey: .deliveryLeadTime)
        try container.encodeIfPresent(self.eligibleCustomerType?.stringValue, forKey: .eligibleCustomerType)
        try container.encodeIfPresent(self.eligibleDuration, forKey: .eligibleDuration)
        try container.encodeIfPresent(self.eligibleQuantity, forKey: .eligibleQuantity)
        try container.encodeIfPresent(self.eligibleRegion, forKey: .eligibleRegion)
        try container.encodeIfPresent(self.eligibleTransactionVolume, forKey: .eligibleTransactionVolume)
        try container.encodeIfPresent(self.gtin12, forKey: .gtin12)
        try container.encodeIfPresent(self.gtin13, forKey: .gtin13)
        try container.encodeIfPresent(self.gtin14, forKey: .gtin14)
        try container.encodeIfPresent(self.gtin8, forKey: .gtin8)
        try container.encodeIfPresent(self.includesObject, forKey: .includesObject)
        try container.encodeIfPresent(self.ineligibleRegion, forKey: .ineligibleRegion)
        try container.encodeIfPresent(self.inventoryLevel, forKey: .inventoryLevel)
        try container.encodeIfPresent(self.itemCondition?.stringValue, forKey: .itemCondition)
        try container.encodeIfPresent(self.itemOffered, forKey: .itemOffered)
        try container.encodeIfPresent(self.mpn, forKey: .mpn)
        try container.encodeIfPresent(self.priceSpecification, forKey: .priceSpecification)
        try container.encodeIfPresent(self.seller, forKey: .seller)
        try container.encodeIfPresent(self.serialNumber, forKey: .serialNumber)
        try container.encodeIfPresent(self.sku, forKey: .sku)
        try container.encodeIfPresent(self.validFrom, forKey: .validFrom)
        try container.encodeIfPresent(self.validThrough, forKey: .validThrough)
        try container.encodeIfPresent(self.warranty, forKey: .warranty)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Demand?, forKey key: K) throws {
        if let typedValue = value as? SODemand {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [Demand]?, forKey key: K) throws {
        if let typedValue = value as? [SODemand] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
