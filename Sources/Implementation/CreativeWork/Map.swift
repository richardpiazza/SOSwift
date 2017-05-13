import Foundation

/// A map.
public class Map: CreativeWork, SchemaMap {
    public override var type: String {
        return "Map"
    }
    
    /// Indicates the kind of Map, from the MapCategoryType Enumeration.
    public var mapType: MapType?
}
