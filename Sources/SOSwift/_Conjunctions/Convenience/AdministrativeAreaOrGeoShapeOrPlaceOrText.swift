public typealias AreaServed = AdministrativeAreaOrGeoShapeOrPlaceOrText

public typealias AdministrativeAreaOrGeoShapeOrPlaceOrText = TripleTextConjunction<AdministrativeArea, GeoShape, Place>

public extension AdministrativeAreaOrGeoShapeOrPlaceOrText {
    var administrativeArea: AdministrativeArea? { first }
    var geoShape: GeoShape? { second }
    var place: Place? { third }
}
