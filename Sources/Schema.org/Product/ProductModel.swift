import Foundation

public protocol SchemaProductModelDataTypeConformance:
                    ProductModelOrText {}

public protocol SchemaProductModel: Product, SchemaProductModelDataTypeConformance {
    var isVariantOf: SchemaProductModel? { get set }
    var predecessorOf: SchemaProductModel? { get set }
    var successorOf: SchemaProductModel? { get set }
}
