public typealias ProductModelOrText = SingleTextConjunction<ProductModel>

public extension ProductModelOrText {
    var productModel: ProductModel? { first }

    static func productModel(value: ProductModel) -> Self {
        .first(value)
    }
}
