import Foundation

public protocol SchemaOwnershipInfoDataTypeConformance:
                    SchemaOwnershipInfoOrProduct
                {}

public protocol SchemaOwnershipInfo: SchemaStructuredValue, SchemaOwnershipInfoDataTypeConformance {
    var acquiredFrom: SchemaOrganizationOrPerson? { get set }
    var ownedFrom: SchemaDateTime? { get set }
    var ownedThrough: SchemaDateTime? { get set }
    var typeOfGood: SchemaProductOrService? { get set }
}
