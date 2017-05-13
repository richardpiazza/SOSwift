import Foundation

public protocol SchemaAdministrativeAreaDataTypeConformance:
                    SchemaAdministrativeAreaOrGeoShapeOrPlaceOrText {}

public protocol SchemaAdministrativeArea: SchemaPlace, SchemaAdministrativeAreaDataTypeConformance {
    
}
