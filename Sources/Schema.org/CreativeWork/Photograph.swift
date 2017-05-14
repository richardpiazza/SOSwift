import Foundation

public protocol SchemaPhotographDataTypeConformance:
                    ImageObjectOrPhotograph {}

public protocol SchemaPhotograph: SchemaCreativeWork, SchemaPhotographDataTypeConformance {
    
}
