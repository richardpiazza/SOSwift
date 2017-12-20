import Foundation

public protocol MapConformace:
                    MapOrURL
                {}

/// A map.
public protocol Map: CreativeWork, MapConformace {
    /// Indicates the kind of Map, from the MapCategoryType Enumeration.
    var mapType: MapType? { get set }
}
