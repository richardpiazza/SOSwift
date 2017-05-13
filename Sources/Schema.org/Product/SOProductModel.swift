import Foundation

public protocol SchemaProductModelDataTypeConformance:
                    SchemaProductModelOrText {}

public protocol SchemaProductModel: SchemaProduct, SchemaProductModelDataTypeConformance {
    var isVariantOf: SchemaProductModel? { get set }
    var predecessorOf: SchemaProductModel? { get set }
    var successorOf: SchemaProductModel? { get set }
}
