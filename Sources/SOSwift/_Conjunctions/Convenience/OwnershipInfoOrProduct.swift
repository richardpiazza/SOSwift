public typealias OwnershipInfoOrProduct = SingleSchemaConjunction<OwnershipInfo, Product>

public extension OwnershipInfoOrProduct {
    var ownershipInfo: OwnershipInfo? { first }
    var product: Product? { second }
    
    static func ownershipInfo(value: OwnershipInfo) -> Self {
        .first(value)
    }
    
    static func product(value: Product) -> Self {
        .second(value)
    }
}
