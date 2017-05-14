import Foundation

public protocol MapConformace:
                    MapOrURL
                {}

public protocol Map: CreativeWork, MapConformace {
    var mapType: MapType? { get set }
}
