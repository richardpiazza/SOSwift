import Foundation

public protocol ItemList: Intangible {
    var itemListElement: ListItemOrTextOrThing? { get set }
    var itemListOrder: ItemListOrderOrText? { get set }
    var numberOfItems: Int? { get set }
}
