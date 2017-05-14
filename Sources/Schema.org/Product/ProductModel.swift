import Foundation

public protocol ProductModelConformance:
                    ProductModelOrText {}

public protocol ProductModel: Product, ProductModelConformance {
    var isVariantOf: ProductModel? { get set }
    var predecessorOf: ProductModel? { get set }
    var successorOf: ProductModel? { get set }
}
