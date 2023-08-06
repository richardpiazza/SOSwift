public typealias ItemListOrderOrText = SingleCodableTextConjunction<ItemListOrder>

public extension ItemListOrderOrText {
    var itemListOrder: ItemListOrder? { first }
    
    static func itemListOrder(value: ItemListOrder) -> Self {
        .first(value)
    }
}
