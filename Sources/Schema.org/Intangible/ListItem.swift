import Foundation

public protocol ListItemConformance:
                    ListItemOrTextOrThing
                {}

public protocol SchemaListItem: Intangible, ListItemConformance {
    var item: Thing? { get set }
    var nextItem: SchemaListItem? { get set }
    var position: IntegerOrText? { get set }
    var previousItem: SchemaListItem? { get set }
}
