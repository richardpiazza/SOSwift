import Foundation

public protocol AdministrativeAreaConformance:
                    AdministrativeAreaOrGeoShapeOrPlaceOrText
                {}

/// A geographical region, typically under the jurisdiction of a particular government.
public protocol AdministrativeArea: Place, AdministrativeAreaConformance {
    
}
