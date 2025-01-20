public typealias GeoCoordinatesOrGeoShape = SingleSchemaConjunction<GeoCoordinates, GeoShape>

public extension GeoCoordinatesOrGeoShape {
    var geoCoordinates: GeoCoordinates? { first }
    var geoShape: GeoShape? { second }

    static func geoCoordinates(value: GeoCoordinates) -> Self {
        .first(value)
    }

    static func geoShape(value: GeoShape) -> Self {
        .second(value)
    }
}
