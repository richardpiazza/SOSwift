import Foundation

public protocol SchemaPhotographDataTypeConformance:
                    SchemaImageObjectOrPhotograph {}

public protocol SchemaPhotograph: SchemaCreativeWork, SchemaPhotographDataTypeConformance {
    
}
