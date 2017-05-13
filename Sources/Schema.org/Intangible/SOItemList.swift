import Foundation

public protocol SchemaItemList: SchemaIntangible {
    var itemListElement: SchemaListItemOrTextOrThing? { get set }
    var itemListOrder: SchemaItemListOrderOrText? { get set }
    var numberOfItems: Int? { get set }
}
