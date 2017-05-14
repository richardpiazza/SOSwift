import Foundation

public protocol OwnershipInfoConformance:
                    OwnershipInfoOrProduct
                {}

public protocol OwnershipInfo: StructuredValue, OwnershipInfoConformance {
    var acquiredFrom: OrganizationOrPerson? { get set }
    var ownedFrom: DateTime? { get set }
    var ownedThrough: DateTime? { get set }
    var typeOfGood: ProductOrService? { get set }
}
