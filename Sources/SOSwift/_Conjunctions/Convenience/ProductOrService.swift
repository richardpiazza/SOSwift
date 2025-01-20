public typealias ProductOrService = SingleSchemaConjunction<Product, Service>

public extension ProductOrService {
    var product: Product? { first }
    var service: Service? { second }

    static func product(value: Product) -> Self {
        .first(value)
    }

    static func service(value: Service) -> Self {
        .second(value)
    }
}
