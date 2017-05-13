import Foundation

public protocol SchemaThingDataTypeConformance:
                    SchemaListItemOrTextOrThing,
                    SchemaTextOrThing {}

public protocol SchemaThing: SchemaThingDataTypeConformance {
    var type: String { get }
    var additionalType: URL? { get set }
    var alternativeName: String? { get set }
    var description: String? { get set }
    var disambiguatingDescription: String? { get set }
    var identifier: SchemaPropertyValueOrTextOrURL? { get set }
    var image: SchemaImageObjectOrURL? { get set }
    var mainEntityOfPage: SchemaCreativeWorkOrURL? { get set }
    var name: String? { get set }
    var potentialAction: SchemaAction? { get set }
    var sameAs: [URL]? { get set }
    var url: URL? { get set }
}

public extension SchemaThing {
    public var context: String {
        return "http://www.schema.org"
    }
}
