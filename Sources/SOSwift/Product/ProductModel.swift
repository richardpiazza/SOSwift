import Foundation

/// A datasheet or vendor specification of a product (in the sense of a
/// prototypical description).
public class ProductModel: Product {

    /// A pointer to a base product from which this product is a variant.
    /// It is safe to infer that the variant inherits all product features from the
    /// base model, unless defined locally. This is not transitive.
    public var isVariantOf: ProductModel?

    /// A pointer from a previous, often discontinued variant of the product
    /// to its newer variant.
    public var predecessorOf: ProductModel?

    /// A pointer from a newer variant of a product to its previous, often
    /// discontinued predecessor.
    public var successorOf: ProductModel?

    enum ProductModelCodingKeys: String, CodingKey {
        case isVariantOf
        case predecessorOf
        case successorOf
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: ProductModelCodingKeys.self)

        isVariantOf = try container.decodeIfPresent(ProductModel.self, forKey: .isVariantOf)
        predecessorOf = try container.decodeIfPresent(ProductModel.self, forKey: .predecessorOf)
        successorOf = try container.decodeIfPresent(ProductModel.self, forKey: .successorOf)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ProductModelCodingKeys.self)

        try container.encodeIfPresent(isVariantOf, forKey: .isVariantOf)
        try container.encodeIfPresent(predecessorOf, forKey: .predecessorOf)
        try container.encodeIfPresent(successorOf, forKey: .successorOf)

        try super.encode(to: encoder)
    }
}
