import Foundation

/// Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.
public class SOProduct: SOThing, Product {
    public struct Keys {
        public static let additionalProperty = "additionalProperty"
        public static let aggregateRating = "aggregateRating"
        public static let audience = "audience"
        public static let award = "award"
        public static let brand = "brand"
        public static let category = "category"
        public static let color = "color"
        public static let depth = "depth"
        public static let gtin12 = "gtin12"
        public static let gtin13 = "gtin13"
        public static let gtin14 = "gtin14"
        public static let gtin8 = "gtin8"
        public static let height = "height"
        public static let isAccessoryOrSparePartFor = "isAccessoryOrSparePartFor"
        public static let isConsumableFor = "isConsumableFor"
        public static let isRelatedTo = "isRelatedTo"
        public static let isSimilarTo = "isSimilarTo"
        public static let itemCondition = "itemCondition"
        public static let logo = "logo"
        public static let manufacturer = "manufacturer"
        public static let material = "material"
        public static let model = "model"
        public static let mpn = "mpn"
        public static let offers = "offers"
        public static let productID = "productID"
        public static let productionDate = "productionDate"
        public static let purchaseDate = "purchaseDate"
        public static let releaseDate = "releaseDate"
        public static let review = "review"
        public static let sku = "sku"
        public static let weight = "weight"
        public static let width = "width"
    }
    
    override public class var type: String {
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
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.additionalProperty] as? [String : AnyObject] {
            self.additionalProperty = SOPropertyValue(dictionary: value)
        }
        if let value = dictionary[Keys.aggregateRating] as? [String : AnyObject] {
            self.aggregateRating = SOAggregateRating(dictionary: value)
        }
        if let value = dictionary[Keys.audience] as? [String : AnyObject] {
            self.audience = SOAudience(dictionary: value)
        }
        if let value = dictionary[Keys.award] as? String {
            self.award = value
        }
        if let value = dictionary[Keys.brand] as? [String : AnyObject] {
            self.brand = makeBrandOrOrganization(dictionary: value)
        }
        if let value = dictionary[Keys.category] {
            self.category = makeTextOrThing(anyObject: value)
        }
        if let value = dictionary[Keys.color] as? String {
            self.color = value
        }
        if let value = dictionary[Keys.depth] as? [String : AnyObject] {
            self.depth = makeDistanceOrQuantitativeValue(dictionary: value)
        }
        if let value = dictionary[Keys.gtin12] as? String {
            self.gtin12 = value
        }
        if let value = dictionary[Keys.gtin13] as? String {
            self.gtin13 = value
        }
        if let value = dictionary[Keys.gtin14] as? String {
            self.gtin14 = value
        }
        if let value = dictionary[Keys.gtin8] as? String {
            self.gtin8 = value
        }
        if let value = dictionary[Keys.height] as? [String : AnyObject] {
            self.height = makeDistanceOrQuantitativeValue(dictionary: value)
        }
        if let value = dictionary[Keys.isAccessoryOrSparePartFor] as? [String : AnyObject] {
            self.isAccessoryOrSparePartFor = SOProduct(dictionary: value)
        }
        if let value = dictionary[Keys.isConsumableFor] as? [String : AnyObject] {
            self.isConsumableFor = SOProduct(dictionary: value)
        }
        if let value = dictionary[Keys.isRelatedTo] as? [String : AnyObject] {
            self.isRelatedTo = makeProductOrService(dictionary: value)
        }
        if let value = dictionary[Keys.isSimilarTo] as? [String : AnyObject] {
            self.isSimilarTo = makeProductOrService(dictionary: value)
        }
        if let value = dictionary[Keys.itemCondition] as? String {
            self.itemCondition = OfferItemCondition(rawValue: value)
        }
        if let value = dictionary[Keys.logo] {
            self.logo = makeImageObjectOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.manufacturer] as? [String : AnyObject] {
            self.manufacturer = SOOrganization(dictionary: value)
        }
        if let value = dictionary[Keys.material] {
            self.material = makeProductOrTextOrURL(anyObject: value)
        }
        if let value = dictionary[Keys.model] {
            self.model = makeProductModelOrText(anyObject: value)
        }
        if let value = dictionary[Keys.mpn] as? String {
            self.mpn = value
        }
        if let value = dictionary[Keys.offers] {
            self.offers = makeOffers(anyObject: value)
        }
        if let value = dictionary[Keys.productID] as? String {
            self.productID = value
        }
        if let value = dictionary[Keys.productionDate] as? String {
            self.productionDate = value
        }
        if let value = dictionary[Keys.purchaseDate] as? String {
            self.purchaseDate = value
        }
        if let value = dictionary[Keys.releaseDate] as? String {
            self.releaseDate = value
        }
        if let value = dictionary[Keys.review] as? [String : AnyObject] {
            self.review = SOReview(dictionary: value)
        }
        if let value = dictionary[Keys.sku] as? String {
            self.sku = value
        }
        if let value = dictionary[Keys.weight] as? [String : AnyObject] {
            self.weight = SOQuantitativeValue(dictionary: value)
        }
        if let value = dictionary[Keys.width] as? [String : AnyObject] {
            self.width = makeDistanceOrQuantitativeValue(dictionary: value)
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.additionalProperty as? SOPropertyValue {
            dictionary[Keys.additionalProperty] = value.dictionary as AnyObject
        }
        if let value = self.aggregateRating as? SOAggregateRating {
            dictionary[Keys.aggregateRating] = value.dictionary as AnyObject
        }
        if let value = self.audience as? SOAudience {
            dictionary[Keys.audience] = value.dictionary as AnyObject
        }
        if let value = self.award {
            dictionary[Keys.award] = value as AnyObject
        }
        if let value = self.brand?.dictionaryValue {
            dictionary[Keys.brand] = value
        }
        if let value = self.category?.dictionaryValue {
            dictionary[Keys.category] = value
        }
        if let value = self.color {
            dictionary[Keys.color] = value as AnyObject
        }
        if let value = self.depth?.dictionaryValue {
            dictionary[Keys.depth] = value
        }
        if let value = self.gtin12 {
            dictionary[Keys.gtin12] = value as AnyObject
        }
        if let value = self.gtin13 {
            dictionary[Keys.gtin13] = value as AnyObject
        }
        if let value = self.gtin14 {
            dictionary[Keys.gtin14] = value as AnyObject
        }
        if let value = self.gtin8 {
            dictionary[Keys.gtin8] = value as AnyObject
        }
        if let value = self.height?.dictionaryValue {
            dictionary[Keys.height] = value
        }
        if let value = self.isAccessoryOrSparePartFor as? SOProduct {
            dictionary[Keys.isAccessoryOrSparePartFor] = value.dictionary as AnyObject
        }
        if let value = self.isConsumableFor as? SOProduct {
            dictionary[Keys.isConsumableFor] = value.dictionary as AnyObject
        }
        if let value = self.isRelatedTo?.dictionaryValue {
            dictionary[Keys.isRelatedTo] = value
        }
        if let value = self.isSimilarTo?.dictionaryValue {
            dictionary[Keys.isSimilarTo] = value
        }
        if let value = self.itemCondition {
            dictionary[Keys.itemCondition] = value.rawValue as AnyObject
        }
        if let value = self.logo?.dictionaryValue {
            dictionary[Keys.logo] = value
        }
        if let value = self.manufacturer as? SOOrganization {
            dictionary[Keys.manufacturer] = value.dictionary as AnyObject
        }
        if let value = self.material?.dictionaryValue {
            dictionary[Keys.material] = value
        }
        if let value = self.model?.dictionaryValue {
            dictionary[Keys.model] = value
        }
        if let value = self.mpn {
            dictionary[Keys.mpn] = value as AnyObject
        }
        if let value = self.offers as? [SOOffer] {
            var values = [[String : AnyObject]]()
            for element in value {
                values.append(element.dictionary)
            }
            dictionary[Keys.offers] = values as AnyObject
        }
        if let value = self.productID {
            dictionary[Keys.productID] = value as AnyObject
        }
        if let value = self.productionDate as? String {
            dictionary[Keys.productionDate] = value as AnyObject
        }
        if let value = self.purchaseDate as? String {
            dictionary[Keys.purchaseDate] = value as AnyObject
        }
        if let value = self.releaseDate as? String {
            dictionary[Keys.releaseDate] = value as AnyObject
        }
        if let value = self.review as? SOReview {
            dictionary[Keys.review] = value.dictionary as AnyObject
        }
        if let value = self.sku {
            dictionary[Keys.sku] = value as AnyObject
        }
        if let value = self.weight as? SOQuantitativeValue {
            dictionary[Keys.weight] = value.dictionary as AnyObject
        }
        if let value = self.width?.dictionaryValue {
            dictionary[Keys.width] = value
        }
        return dictionary
    }
}
