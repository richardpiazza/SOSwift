import Foundation
import SOSwiftVocabulary

/// Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.
public class SOProduct: SOThing, Product {

    public override class var type: String {
        return "Product"
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
    public var category: TextOrThing?
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
    public var isAccessoryOrSparePartFor: Product?
    /// A pointer to another product (or multiple products) for which this product is a consumable.
    public var isConsumableFor: Product?
    /// A pointer to another, somehow related product (or multiple products).
    public var isRelatedTo: ProductOrService?
    /// A pointer to another, functionally similar product (or multiple products).
    public var isSimilarTo: ProductOrService?
    /// A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
    public var itemCondition: OfferItemCondition?
    /// An associated logo.
    public var logo: ImageObjectOrURL?
    /// The manufacturer of the product.
    public var manufacturer: Organization?
    /// A material that something is made from, e.g. leather, wool, cotton, paper.
    public var material: ProductOrTextOrURL?
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
    public var review: Review?
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
        case isAccessoryOrSparePartFor
        case isConsumableFor
        case isRelatedTo
        case isSimilarTo
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
        case review
        case sku
        case weight
        case width
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOPropertyValue.self, forKey: .additionalProperty) {
            self.additionalProperty = value
        }
        if let value = try container.decodeIfPresent(SOAggregateRating.self, forKey: .aggregateRating) {
            self.aggregateRating = value
        }
        if let value = try container.decodeIfPresent(SOAudience.self, forKey: .audience) {
            self.audience = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .award) {
            self.award = value
        }
        if let value = try container.decodeBrandOrOrganizationIfPresent(forKey: .brand) {
            self.brand = value
        }
        if let value = try container.decodeTextOrThingIfPresent(forKey: .category) {
            self.category = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .color) {
            self.color = value
        }
        if let value = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .depth) {
            self.depth = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .gtin12) {
            self.gtin12 = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .gtin13) {
            self.gtin13 = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .gtin14) {
            self.gtin14 = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .gtin8) {
            self.gtin8 = value
        }
        if let value = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .height) {
            self.height = value
        }
        if let value = try container.decodeIfPresent(SOProduct.self, forKey: .isAccessoryOrSparePartFor) {
            self.isAccessoryOrSparePartFor = value
        }
        if let value = try container.decodeIfPresent(SOProduct.self, forKey: .isConsumableFor) {
            self.isConsumableFor = value
        }
        if let value = try container.decodeProductOrServiceIfPresent(forKey: .isRelatedTo) {
            self.isRelatedTo = value
        }
        if let value = try container.decodeProductOrServiceIfPresent(forKey: .isSimilarTo) {
            self.isSimilarTo = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .itemCondition) {
            self.itemCondition = OfferItemCondition(rawValue: value)
        }
        if let value = try container.decodeImageObjectOrURLIfPresent(forKey: .logo) {
            self.logo = value
        }
        if let value = try container.decodeIfPresent(SOOrganization.self, forKey: .manufacturer) {
            self.manufacturer = value
        }
        if let value = try container.decodeProductOrTextOrURLIfPresent(forKey: .material) {
            self.material = value
        }
        if let value = try container.decodeProductModelOrTextIfPresent(forKey: .model) {
            self.model = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .mpn) {
            self.mpn = value
        }
        if let value = try container.decodeIfPresent([SOOffer].self, forKey: .offers) {
            self.offers = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .productID) {
            self.productID = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .productionDate) {
            self.productionDate = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .purchaseDate) {
            self.purchaseDate = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .releaseDate) {
            self.releaseDate = value
        }
        if let value = try container.decodeIfPresent(SOReview.self, forKey: .review) {
            self.review = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .sku) {
            self.sku = value
        }
        if let value = try container.decodeIfPresent(SOQuantitativeValue.self, forKey: .weight) {
            self.weight = value
        }
        if let value = try container.decodeDistanceOrQuantitativeValueIfPresent(forKey: .width) {
            self.width = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.additionalProperty as? SOPropertyValue {
            try container.encode(value, forKey: .additionalProperty)
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            try container.encode(value, forKey: .aggregateRating)
        }
        if let value = self.audience as? SOAudience {
            try container.encode(value, forKey: .audience)
        }
        if let value = self.award {
            try container.encode(value, forKey: .award)
        }
        try container.encodeIfPresent(self.brand, forKey: .brand)
        if let value = self.category {
            try container.encodeTextOrThing(value, forKey: .category)
        }
        if let value = self.color {
            try container.encode(value, forKey: .color)
        }
        if let value = self.depth {
            try container.encodeDistanceOrQuantitativeValue(value, forKey: .depth)
        }
        if let value = self.gtin12 {
            try container.encode(value, forKey: .gtin12)
        }
        if let value = self.gtin13 {
            try container.encode(value, forKey: .gtin13)
        }
        if let value = self.gtin14 {
            try container.encode(value, forKey: .gtin14)
        }
        if let value = self.gtin8 {
            try container.encode(value, forKey: .gtin8)
        }
        if let value = self.height {
            try container.encodeDistanceOrQuantitativeValue(value, forKey: .height)
        }
        if let value = self.isAccessoryOrSparePartFor as? SOProduct {
            try container.encode(value, forKey: .isAccessoryOrSparePartFor)
        }
        if let value = self.isConsumableFor as? SOProduct {
            try container.encode(value, forKey: .isConsumableFor)
        }
        if let value = self.isRelatedTo {
            try container.encodeProductOrService(value, forKey: .isRelatedTo)
        }
        if let value = self.isSimilarTo {
            try container.encodeProductOrService(value, forKey: .isSimilarTo)
        }
        if let value = self.itemCondition {
            try container.encode(value.rawValue, forKey: .itemCondition)
        }
        if let value = self.logo {
            try container.encodeImageObjectOrURL(value, forKey: .logo)
        }
        if let value = self.manufacturer as? SOOrganization {
            try container.encode(value, forKey: .manufacturer)
        }
        if let value = self.material {
            try container.encodeProductOrTextOrURL(value, forKey: .material)
        }
        if let value = self.model {
            try container.encodeProductModelOrText(value, forKey: .model)
        }
        if let value = self.mpn {
            try container.encode(value, forKey: .mpn)
        }
        if let value = self.offers as? [SOOffer] {
            try container.encode(value, forKey: .offers)
        }
        if let value = self.productID {
            try container.encode(value, forKey: .productID)
        }
        if let value = self.productionDate as? String {
            try container.encode(value, forKey: .productionDate)
        }
        if let value = self.purchaseDate as? String {
            try container.encode(value, forKey: .purchaseDate)
        }
        if let value = self.releaseDate as? String {
            try container.encode(value, forKey: .releaseDate)
        }
        if let value = self.review as? SOReview {
            try container.encode(value, forKey: .review)
        }
        if let value = self.sku {
            try container.encode(value, forKey: .sku)
        }
        if let value = self.weight as? SOQuantitativeValue {
            try container.encode(value, forKey: .weight)
        }
        if let value = self.width {
            try container.encodeDistanceOrQuantitativeValue(value, forKey: .width)
        }
        
        try super.encode(to: encoder)
    }
}
