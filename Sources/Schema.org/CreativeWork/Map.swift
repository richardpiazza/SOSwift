import Foundation

public protocol SchemaMapDataTypeConformace:
                    MapOrURL {}

public protocol SchemaMap: SchemaCreativeWork, SchemaMapDataTypeConformace {
    var mapType: MapType? { get set }
}
