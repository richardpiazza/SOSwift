import Foundation

public typealias MapOrURL = SingleURLConjunction<Map>

public extension MapOrURL {
    var map: Map? { first }

    static func map(value: Map) -> Self {
        .first(value)
    }
}
