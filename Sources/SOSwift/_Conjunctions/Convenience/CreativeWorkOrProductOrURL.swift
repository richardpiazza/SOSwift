import Foundation

public typealias CreativeWorkOrProductOrURL = DoubleURLConjunction<CreativeWork, Product>

public extension CreativeWorkOrProductOrURL {
    var creativeWork: CreativeWork? { first }
    var product: Product? { second }

    static func creativeWork(value: CreativeWork) -> Self {
        .first(value)
    }

    static func product(value: Product) -> Self {
        .second(value)
    }
}
