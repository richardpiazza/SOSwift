import Foundation

public protocol SchemaMapDataTypeConformace:
                    SchemaMapOrURL {}

public protocol SchemaMap: SchemaCreativeWork, SchemaMapDataTypeConformace {
    var mapType: MapType? { get set }
}
