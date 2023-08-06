public typealias GeoShapeOrPlaceOrText = DoubleTextConjunction<GeoShape, Place>

public extension GeoShapeOrPlaceOrText {
    var geoShape: GeoShape? { first }
    var place: Place? { second }
    
    static func geoShape(value: GeoShape) -> Self {
        .first(value)
    }
    
    static func place(value: Place) -> Self {
        .second(value)
    }
}
