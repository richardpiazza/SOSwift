import Foundation

/// A structured value providing information about when a certain organization or person owned a certain product.
public class OwnershipInfo: StructuredValue, SchemaOwnershipInfo {
    override public var type: String {
        return "OwnershipInfo"
    }
    
    /// The organization or person from which the product was acquired.
    public var acquiredFrom: SchemaOrganizationOrPerson?
    /// The date and time of obtaining the product.
    public var ownedFrom: SchemaDateTime?
    /// The date and time of giving up ownership on the product.
    public var ownedThrough: SchemaDateTime?
    /// The product that this structured value is referring to.
    public var typeOfGood: SchemaProductOrService?
}
