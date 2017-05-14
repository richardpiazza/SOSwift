import Foundation

public protocol OwnershipInfoConformance:
                    OwnershipInfoOrProduct
                {}

/// A structured value providing information about when a certain organization or person owned a certain product.
public protocol OwnershipInfo: StructuredValue, OwnershipInfoConformance {
    /// The organization or person from which the product was acquired.
    var acquiredFrom: OrganizationOrPerson? { get set }
    /// The date and time of obtaining the product.
    var ownedFrom: DateTime? { get set }
    /// The date and time of giving up ownership on the product.
    var ownedThrough: DateTime? { get set }
    /// The product that this structured value is referring to.
    var typeOfGood: ProductOrService? { get set }
}
