import Foundation

public class ListItem: Intangible {
    
    /// An entity represented by an entry in a list or data feed
    /// (e.g. an 'artist' in a list of 'artists')’.
    public var item: Thing?
    
    /// A link to the ListItem that follows the current one.
    public var nextItem: ListItem?
    
    /// The position of an item in a series or sequence of items.
    public var position: IntegerOrText?
    
    /// A link to the ListItem that preceeds the current one.
    public var previousItem: ListItem?
    
}
