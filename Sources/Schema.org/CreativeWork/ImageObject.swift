import Foundation

public protocol SchemaImageObjectDataTypeConformance:
                    ImageObjectOrURL,
                    ImageObjectOrPhotograph {}

public protocol SchemaImageObject: SchemaMediaObject, SchemaImageObjectDataTypeConformance {
    
}
