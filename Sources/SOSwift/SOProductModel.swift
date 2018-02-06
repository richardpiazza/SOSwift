import Foundation
import SOSwiftVocabulary

/// A datasheet or vendor specification of a product (in the sense of a prototypical description).
public class SOProductModel: SOProduct, ProductModel {
    
    public override class var type: String {
        return "ProductModel"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
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
    
    public override init() {
        super.init()
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
        
        try super.init(from: decoder)
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
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.isVariantOf.rawValue:
            return "A base product from which this product is a variant."
        case CodingKeys.predecessorOf.rawValue:
            return "A previous, often discontinued variant of the product to its newer variant."
        case CodingKeys.successorOf.rawValue:
            return "A newer variant of a product to its previous, often discontinued predecessor."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.isVariantOf.rawValue:
            self.isVariantOf = value as? ProductModel
        case CodingKeys.predecessorOf.rawValue:
            self.predecessorOf = value as? ProductModel
        case CodingKeys.successorOf.rawValue:
            self.successorOf = value as? ProductModel
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: ProductModel?, forKey key: K) throws {
        if let typedValue = value as? SOProductModel {
            try self.encode(typedValue, forKey: key)
        }
    }
}
