import Foundation
import SOSwiftVocabulary

/// A datasheet or vendor specification of a product (in the sense of a prototypical description).
public class SOProductModel: SOProduct, ProductModel {
    
    public override class var type: String {
        return "ProductModel"
    }
    
    /// A pointer to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive.
    public var isVariantOf: ProductModel?
    /// A pointer from a previous, often discontinued variant of the product to its newer variant.
    public var predecessorOf: ProductModel?
    /// A pointer from a newer variant of a product to its previous, often discontinued predecessor.
    public var successorOf: ProductModel?
    
    private enum CodingKeys: String, CodingKey {
        case isVariantOf
        case predecessorOf
        case successorOf
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOProductModel.self, forKey: .isVariantOf) {
            self.isVariantOf = value
        }
        if let value = try container.decodeIfPresent(SOProductModel.self, forKey: .predecessorOf) {
            self.predecessorOf = value
        }
        if let value = try container.decodeIfPresent(SOProductModel.self, forKey: .successorOf) {
            self.successorOf = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.isVariantOf as? SOProductModel {
            try container.encode(value, forKey: .isVariantOf)
        }
        if let value = self.predecessorOf as? SOProductModel {
            try container.encode(value, forKey: .predecessorOf)
        }
        if let value = self.successorOf as? SOProductModel {
            try container.encode(value, forKey: .successorOf)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
