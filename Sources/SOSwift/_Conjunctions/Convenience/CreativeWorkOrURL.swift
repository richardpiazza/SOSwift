import Foundation

public typealias CreativeWorkOrURL = SingleURLConjunction<CreativeWork>

public extension CreativeWorkOrURL {
    var creativeWork: CreativeWork? { first }

    static func creativeWork(value: CreativeWork) -> Self {
        .first(value)
    }
}
