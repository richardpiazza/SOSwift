import Foundation

/// A map.
public class SOMap: SOCreativeWork, Map {
    override public class var type: String {
        return "Map"
    }
    
    /// Indicates the kind of Map, from the MapCategoryType Enumeration.
    public var mapType: MapType?
}
