import Foundation

public protocol ListItemConformance:
                    ListItemOrThingOrText
                {}

/// An list item, e.g. a step in a checklist or how-to description.
public protocol ListItem: Intangible, ListItemConformance {
    /// An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists')’.
    var item: Thing? { get set }
    /// A link to the ListItem that follows the current one.
    var nextItem: ListItem? { get set }
    /// The position of an item in a series or sequence of items.
    var position: IntegerOrText? { get set }
    /// A link to the ListItem that preceeds the current one.
    var previousItem: ListItem? { get set }
}
