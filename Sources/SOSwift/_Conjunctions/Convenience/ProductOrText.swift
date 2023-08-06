public typealias ProductOrText = SingleTextConjunction<Product>

public extension ProductOrText {
    var product: Product? { first }
    
    static func product(value: Product) -> Self {
        .first(value)
    }
}
