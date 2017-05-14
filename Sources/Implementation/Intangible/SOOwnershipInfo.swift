import Foundation

/// A structured value providing information about when a certain organization or person owned a certain product.
public class OwnershipInfo: SOStructuredValue, SchemaOwnershipInfo {
    override public class var type: String {
        return "OwnershipInfo"
    }
    
    /// The organization or person from which the product was acquired.
    public var acquiredFrom: OrganizationOrPerson?
    /// The date and time of obtaining the product.
    public var ownedFrom: DateTime?
    /// The date and time of giving up ownership on the product.
    public var ownedThrough: DateTime?
    /// The product that this structured value is referring to.
    public var typeOfGood: ProductOrService?
}
