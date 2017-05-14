import Foundation

public protocol ListItemConformance:
                    ListItemOrTextOrThing
                {}

public protocol ListItem: Intangible, ListItemConformance {
    var item: Thing? { get set }
    var nextItem: ListItem? { get set }
    var position: IntegerOrText? { get set }
    var previousItem: ListItem? { get set }
}
