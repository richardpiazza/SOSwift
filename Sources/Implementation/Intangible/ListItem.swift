import Foundation

public class ListItem: Intangible, SchemaListItem {
    public override var type: String {
        return "ListItem"
    }
    
    /// An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists')’.
    public var item: SchemaThing?
    /// A link to the ListItem that follows the current one.
    public var nextItem: SchemaListItem?
    /// The position of an item in a series or sequence of items.
    public var position: SchemaIntegerOrText?
    /// A link to the ListItem that preceeds the current one.
    public var previousItem: SchemaListItem?
}
