import Foundation

public protocol SchemaAdministrativeAreaDataTypeConformance:
                    AdministrativeAreaOrGeoShapeOrPlaceOrText {}

public protocol SchemaAdministrativeArea: SchemaPlace, SchemaAdministrativeAreaDataTypeConformance {
    
}
