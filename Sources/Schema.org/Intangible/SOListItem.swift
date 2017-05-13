import Foundation

public protocol SchemaListItem: SchemaIntangible, SchemaListItemOrTextOrThing {
    var item: SchemaThing? { get set }
    var nextItem: SchemaListItem? { get set }
    var position: SchemaIntegerOrText? { get set }
    var previousItem: SchemaListItem? { get set }
}
