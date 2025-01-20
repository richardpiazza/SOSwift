import Foundation

/// A map.
public class Map: CreativeWork {

    /// Indicates the kind of Map, from the MapCategoryType Enumeration.
    public var mapType: MapType?

    enum MapCodingKeys: String, CodingKey {
        case mapType
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: MapCodingKeys.self)

        mapType = try container.decodeIfPresent(MapType.self, forKey: .mapType)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MapCodingKeys.self)

        try container.encodeIfPresent(mapType, forKey: .mapType)

        try super.encode(to: encoder)
    }
}
