import Foundation

public protocol SchemaImageObjectDataTypeConformance:
                    SchemaImageObjectOrURL,
                    SchemaImageObjectOrPhotograph {}

public protocol SchemaImageObject: SchemaMediaObject, SchemaImageObjectDataTypeConformance {
    
}
