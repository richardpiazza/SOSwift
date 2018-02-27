import Foundation
import SOSwiftVocabulary

/// Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.
public class SOProduct: SOThing, Product {
    
    public override class var type: String {
        return "Product"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return [
            SOProductModel.self
        ]
    }
    
    /// A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.
    /// - Note: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
    public var additionalProperty: PropertyValue?
    /// The overall rating, based on a collection of reviews or ratings, of the item.
    public var aggregateRating: AggregateRating?
    /// An intended audience, i.e. a group for whom something was created.
    public var audience: Audience?
    /// An award won by or for this item.
    public var award: String?
    /// The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
    public var brand: BrandOrOrganization?
    /// A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.
    public var category: ThingOrText?
    /// The color of the product.
    public var color: String?
    /// The depth of the item.
    public var depth: DistanceOrQuantitativeValue?
    /// The GTIN-12 code of the product, or the product to which the offer refers. The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items.
    public var gtin12: String?
    /// The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero.
    public var gtin13: String?
    /// The GTIN-14 code of the product, or the product to which the offer refers.
    public var gtin14: String?
    /// The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN.
    public var gtin8: String?
    /// The height of the item.
    public var height: DistanceOrQuantitativeValue?
    /// A pointer to another product (or multiple products) for which this product is an accessory or spare part.
    public var accessoryOrSparePartFor: [Product]?
    /// A pointer to another product (or multiple products) for which this product is a consumable.
    public var consumableFor: [Product]?
    /// A pointer to another, somehow related product (or multiple products).
    public var relatedTo: [ProductOrService]?
    /// A pointer to another, functionally similar product (or multiple products).
    public var similarTo: [ProductOrService]?
    /// A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
    public var itemCondition: OfferItemCondition?
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    /// The manufacturer of the product.
    public var manufacturer: Organization?
    /// A material that something is made from, e.g. leather, wool, cotton, paper.
    public var material: ProductOrURLOrText?
    /// The model of the product. Use with the URL of a ProductModel or a textual representation of the model identifier. The URL of the ProductModel can be from an external source. It is recommended to additionally provide strong product identifiers via the gtin8/gtin13/gtin14 and mpn properties.
    public var model: ProductModelOrText?
    /// The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
    public var mpn: String?
    /// An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event.
    public var offers: [Offer]?
    /// The product identifier, such as ISBN. For example: meta itemprop="productID" content="isbn:123-456-789".
    public var productID: String?
    /// The date of production of the item, e.g. vehicle.
    public var productionDate: DateOnly?
    /// The date the item e.g. vehicle was purchased by the current owner.
    public var purchaseDate: DateOnly?
    /// The release date of a product or product model. This can be used to distinguish the exact variant of a product.
    public var releaseDate: DateOnly?
    /// A review of the item.
    public var reviews: [Review]?
    /// The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
    public var sku: String?
    /// The weight of the product or person.
    public var weight: QuantitativeValue?
    /// The width of the item.
    public var width: DistanceOrQuantitativeValue?
    
    private enum CodingKeys: String, CodingKey {
        case additionalProperty
        case aggregateRating
        case audience
        case award
        case brand
        case category
        case color
        case depth
        case gtin12
        case gtin13
        case gtin14
        case gtin8
        case height
        case accessoryOrSparePartFor = "isAccessoryOrSparePartFor"
        case consumableFor = "isConsumableFor"
        case relatedTo = "isRelatedTo"
        case similarTo = "isSimilarTo"
        case itemCondition
        case logo
        case manufacturer
        case material
        case model
        case mpn
        case offers
        case productID
        case productionDate
        case purchaseDate
        case releaseDate
        case reviews = "review"
        case sku
        case weight
        case width
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.additionalProperty = try container.decodeIfPresent(SOPropertyValue.self, forKey: .additionalProperty)
        self.aggregateRating = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating)
        self.audience = try container.decodeIfPresent(SOAudience.self, forKey: .audience)
        self.award = try container.decodeIfPresent(String.self, forKey: .award)
        self.brand = try container.decodeBrandOrOrganizationIfPresent(forKey: .brand)
        self.category = try container.decodeThingOrTextIfPresent(forKey: .category)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        self.depth = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .depth)
        self.gtin12 = try container.decodeIfPresent(String.self, forKey: .gtin12)
        self.gtin13 = try container.decodeIfPresent(String.self, forKey: .gtin13)
        self.gtin14 = try container.decodeIfPresent(String.self, forKey: .gtin14)
        self.gtin8 = try container.decodeIfPresent(String.self, forKey: .gtin8)
        self.height = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .height)
        self.accessoryOrSparePartFor = try container.decodeArrayOrElementIfPresent(SOProduct.self, forKey: .accessoryOrSparePartFor)
        self.consumableFor = try container.decodeArrayOrElementIfPresent(SOProduct.self, forKey: .consumableFor)
        self.relatedTo = try container.decodeProductsOrServicesIfPresent(forKey: .relatedTo)
        self.similarTo = try container.decodeProductsOrServicesIfPresent(forKey: .similarTo)
        if let value = try container.decodeIfPresent(String.self, forKey: .itemCondition) {
            self.itemCondition = OfferItemCondition(rawValue: value)
        }
        self.logo = try container.decodeImageObjectOrURLIfPresent(forKey: .logo)
        self.manufacturer = try container.decodeIfPresent(SOOrganization.self, forKey: .manufacturer)
        self.material = try container.decodeProductOrURLOrTextIfPresent(forKey: .material)
        self.model = try container.decodeProductModelOrTextIfPresent(forKey: .model)
        self.mpn = try container.decodeIfPresent(String.self, forKey: .mpn)
        self.offers = try container.decodeIfPresent([SOOffer].self, forKey: .offers)
        self.productID = try container.decodeIfPresent(String.self, forKey: .productID)
        self.productionDate = try container.decodeDateOnlyIfPresent(forKey: .productionDate)
        self.purchaseDate = try container.decodeDateOnlyIfPresent(forKey: .purchaseDate)
        self.releaseDate = try container.decodeDateOnlyIfPresent(forKey: .releaseDate)
        self.reviews = try container.decodeArrayOrElementIfPresent(SOReview.self, forKey: .reviews)
        self.sku = try container.decodeIfPresent(String.self, forKey: .sku)
        self.weight = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .weight)
        self.width = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .width)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.additionalProperty, forKey: .additionalProperty)
        try container.encodeIfPresent(self.aggregateRating, forKey: .aggregateRating)
        try container.encodeIfPresent(self.audience, forKey: .audience)
        try container.encodeIfPresent(self.award, forKey: .award)
        try container.encodeIfPresent(self.brand, forKey: .brand)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.color, forKey: .color)
        try container.encodeIfPresent(self.depth, forKey: .depth)
        try container.encodeIfPresent(self.gtin12, forKey: .gtin12)
        try container.encodeIfPresent(self.gtin13, forKey: .gtin13)
        try container.encodeIfPresent(self.gtin14, forKey: .gtin14)
        try container.encodeIfPresent(self.gtin8, forKey: .gtin8)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.accessoryOrSparePartFor, forKey: .accessoryOrSparePartFor)
        try container.encodeIfPresent(self.consumableFor, forKey: .consumableFor)
        try container.encodeIfPresent(self.relatedTo, forKey: .relatedTo)
        try container.encodeIfPresent(self.similarTo, forKey: .similarTo)
        try container.encodeIfPresent(self.itemCondition?.rawValue, forKey: .itemCondition)
        try container.encodeIfPresent(self.logo, forKey: .logo)
        try container.encodeIfPresent(self.manufacturer, forKey: .manufacturer)
        try container.encodeIfPresent(self.material, forKey: .material)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.mpn, forKey: .mpn)
        try container.encodeIfPresent(self.offers, forKey: .offers)
        try container.encodeIfPresent(self.productID, forKey: .productID)
        try container.encodeIfPresent(self.productionDate, forKey: .productionDate)
        try container.encodeIfPresent(self.purchaseDate, forKey: .purchaseDate)
        try container.encodeIfPresent(self.releaseDate, forKey: .releaseDate)
        try container.encodeIfPresent(self.reviews, forKey: .reviews)
        try container.encodeIfPresent(self.sku, forKey: .sku)
        try container.encodeIfPresent(self.weight, forKey: .weight)
        try container.encodeIfPresent(self.width, forKey: .width)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.additionalProperty.rawValue:
            return "A property-value pair representing an additional characteristics of the entitity."
        case CodingKeys.aggregateRating.rawValue:
            return "The overall rating, based on a collection of reviews or ratings, of the item."
        case CodingKeys.audience.rawValue:
            return "An intended audience, i.e. a group for whom something was created."
        case CodingKeys.award.rawValue:
            return "An award won by or for this item."
        case CodingKeys.brand.rawValue:
            return "The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person."
        case CodingKeys.category.rawValue:
            return "A category for the item."
        case CodingKeys.color.rawValue:
            return "The color of the product."
        case CodingKeys.depth.rawValue:
            return "The depth of the item."
        case CodingKeys.gtin12.rawValue:
            return "The GTIN-12 code of the product, or the product to which the offer refers."
        case CodingKeys.gtin13.rawValue:
            return "The GTIN-13 code of the product, or the product to which the offer refers."
        case CodingKeys.gtin14.rawValue:
            return "The GTIN-14 code of the product, or the product to which the offer refers."
        case CodingKeys.gtin8.rawValue:
            return "The GTIN-8 code of the product, or the product to which the offer refers."
        case CodingKeys.height.rawValue:
            return "The height of the item."
        case "accessoryOrSparePartFor":
            return "A pointer to another product (or multiple products) for which this product is an accessory or spare part."
        case "consumableFor":
            return "A pointer to another product (or multiple products) for which this product is a consumable."
        case "relatedTo":
            return "A pointer to another, somehow related product (or multiple products)."
        case "similarTo":
            return "A pointer to another, functionally similar product (or multiple products)."
        case CodingKeys.itemCondition.rawValue:
            return "A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer."
        case CodingKeys.logo.rawValue:
            return "An associated logo."
        case CodingKeys.manufacturer.rawValue:
            return "The manufacturer of the product."
        case CodingKeys.material.rawValue:
            return "A material that something is made from, e.g. leather, wool, cotton, paper."
        case CodingKeys.model.rawValue:
            return "The model of the product."
        case CodingKeys.mpn.rawValue:
            return "The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers."
        case CodingKeys.offers.rawValue:
            return "An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event."
        case CodingKeys.productID.rawValue:
            return "The product identifier, such as ISBN."
        case CodingKeys.productionDate.rawValue:
            return "The date of production of the item, e.g. vehicle."
        case CodingKeys.purchaseDate.rawValue:
            return "The date the item e.g. vehicle was purchased by the current owner."
        case CodingKeys.releaseDate.rawValue:
            return "The release date of a product or product model."
        case "reviews":
            return "A review of the item."
        case CodingKeys.sku.rawValue:
            return "The Stock Keeping Unit."
        case CodingKeys.weight.rawValue:
            return "The weight of the product or person."
        case CodingKeys.width.rawValue:
            return "The width of the item."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.additionalProperty.rawValue:
            self.additionalProperty = value as? PropertyValue
        case CodingKeys.aggregateRating.rawValue:
            self.aggregateRating = value as? AggregateRating
        case CodingKeys.audience.rawValue:
            self.audience = value as? Audience
        case CodingKeys.award.rawValue:
            self.award = value as? String
        case CodingKeys.brand.rawValue:
            self.brand = value as? BrandOrOrganization
        case CodingKeys.category.rawValue:
            self.category = value as? ThingOrText
        case CodingKeys.color.rawValue:
            self.color = value as? String
        case CodingKeys.depth.rawValue:
            self.depth = value as? DistanceOrQuantitativeValue
        case CodingKeys.gtin12.rawValue:
            self.gtin12 = value as? String
        case CodingKeys.gtin13.rawValue:
            self.gtin13 = value as? String
        case CodingKeys.gtin14.rawValue:
            self.gtin14 = value as? String
        case CodingKeys.gtin8.rawValue:
            self.gtin8 = value as? String
        case CodingKeys.height.rawValue:
            self.height = value as? DistanceOrQuantitativeValue
        case "accessoryOrSparePartFor":
            self.accessoryOrSparePartFor = value as? [Product]
        case "consumableFor":
            self.consumableFor = value as? [Product]
        case "relatedTo":
            self.relatedTo = value as? [ProductOrService]
        case "similarTo":
            self.similarTo = value as? [ProductOrService]
        case CodingKeys.itemCondition.rawValue:
            self.itemCondition = value as? OfferItemCondition
        case CodingKeys.logo.rawValue:
            self.logo = value as? ImageObjectOrURL
        case CodingKeys.manufacturer.rawValue:
            self.manufacturer = value as? Organization
        case CodingKeys.material.rawValue:
            self.material = value as? ProductOrURLOrText
        case CodingKeys.model.rawValue:
            self.model = value as? ProductModelOrText
        case CodingKeys.mpn.rawValue:
            self.mpn = value as? String
        case CodingKeys.offers.rawValue:
            self.offers = value as? [Offer]
        case CodingKeys.productID.rawValue:
            self.productID = value as? String
        case CodingKeys.productionDate.rawValue:
            self.productionDate = value as? DateOnly
        case CodingKeys.purchaseDate.rawValue:
            self.purchaseDate = value as? DateOnly
        case CodingKeys.releaseDate.rawValue:
            self.releaseDate = value as? DateOnly
        case "reviews":
            self.reviews = value as? [Review]
        case CodingKeys.sku.rawValue:
            self.sku = value as? String
        case CodingKeys.weight.rawValue:
            self.weight = value as? QuantitativeValue
        case CodingKeys.width.rawValue:
            self.width = value as? DistanceOrQuantitativeValue
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Product?, forKey key: K) throws {
        if let typedValue = value as? SOProduct {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [Product]?, forKey key: K) throws {
        if let typedValue = value as? [SOProduct] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
