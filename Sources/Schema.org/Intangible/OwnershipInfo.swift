import Foundation

public protocol SchemaOwnershipInfoDataTypeConformance:
                    OwnershipInfoOrProduct
                {}

public protocol SchemaOwnershipInfo: StructuredValue, SchemaOwnershipInfoDataTypeConformance {
    var acquiredFrom: OrganizationOrPerson? { get set }
    var ownedFrom: DateTime? { get set }
    var ownedThrough: DateTime? { get set }
    var typeOfGood: ProductOrService? { get set }
}
