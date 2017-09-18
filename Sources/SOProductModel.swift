import Foundation
import SOSwiftVocabulary

/// A datasheet or vendor specification of a product (in the sense of a prototypical description).
public class SOProductModel: SOProduct, ProductModel {
    public struct Keys {
        public static let isVariantOf = "isVariantOf"
        public static let predecessorOf = "predecessorOf"
        public static let successorOf = "successorOf"
    }
    
    override public class var type: String {
        return "ProductModel"
    }
    
    /// A pointer to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive.
    public var isVariantOf: ProductModel?
    /// A pointer from a previous, often discontinued variant of the product to its newer variant.
    public var predecessorOf: ProductModel?
    /// A pointer from a newer variant of a product to its previous, often discontinued predecessor.
    public var successorOf: ProductModel?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.isVariantOf] as? [String : AnyObject] {
            self.isVariantOf = SOProductModel(dictionary: value)
        }
        if let value = dictionary[Keys.predecessorOf] as? [String : AnyObject] {
            self.predecessorOf = SOProductModel(dictionary: value)
        }
        if let value = dictionary[Keys.successorOf] as? [String : AnyObject] {
            self.successorOf = SOProductModel(dictionary: value)
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.isVariantOf as? SOProductModel {
            dictionary[Keys.isVariantOf] = value.dictionary as AnyObject
        }
        if let value = self.predecessorOf as? SOProductModel {
            dictionary[Keys.predecessorOf] = value.dictionary as AnyObject
        }
        if let value = self.successorOf as? SOProductModel {
            dictionary[Keys.successorOf] = value.dictionary as AnyObject
        }
        return dictionary
    }
}
