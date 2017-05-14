import Foundation

public protocol SchemaAdministrativeAreaDataTypeConformance:
                    AdministrativeAreaOrGeoShapeOrPlaceOrText {}

public protocol AdministrativeArea: Place, SchemaAdministrativeAreaDataTypeConformance {
    
}
