import Foundation

/// AdministrativeArea, GeoShape, Place, Text
public protocol AdministrativeAreaOrGeoShapeOrPlaceOrText {}

extension String: AdministrativeAreaOrGeoShapeOrPlaceOrText {}
