import Foundation
import SOSwiftVocabulary

/// A list of items of any sort—for example, Top 10 Movies About Weathermen, or Top 100 Party Songs. Not to be confused with HTML lists, which are often used only for formatting.
public class SOItemList: SOIntangible, ItemList {
    
    public override class var type: String {
        return "ItemList"
    }
    
    /// For itemListElement values, you can use simple strings (e.g. "Peter", "Paul", "Mary"), existing entities, or use ListItem.
    /// Text values are best if the elements in the list are plain strings. Existing entities are best for a simple, unordered list of existing things in your data. ListItem is used with ordered lists when you want to provide additional context about the element in that list or when the same item might be in different places in different lists.
    /// -note: The order of elements in your mark-up is not sufficient for indicating the order or elements. Use ListItem with a 'position' property in such cases.
    public var itemListElement: ListItemOrTextOrThing?
    /// Type of ordering (e.g. Ascending, Descending, Unordered).
    public var itemListOrder: ItemListOrderOrText?
    /// The number of items in an ItemList. Note that some descriptions might not fully describe all items in a list (e.g., multi-page pagination); in such cases, the numberOfItems would be for the entire list.
    public var numberOfItems: Int?
    
    private enum CodingKeys: String, CodingKey {
        case itemListElement
        case itemListOrder
        case numberOfItems
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeListItemOrTextOrThingIfPresent(forKey: .itemListElement) {
            self.itemListElement = value
        }
        if let value = try container.decodeItemListOrderOrTextIfPresent(forKey: .itemListOrder) {
            self.itemListOrder = value
        }
        if let value = try container.decodeIfPresent(Int.self, forKey: .numberOfItems) {
            self.numberOfItems = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.itemListElement, forKey: .itemListElement)
        try container.encodeIfPresent(self.itemListOrder, forKey: .itemListOrder)
        if let value = self.numberOfItems {
            try container.encode(value, forKey: .numberOfItems)
        }
        
        try super.encode(to: encoder)
    }
}
