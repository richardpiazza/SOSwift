import Foundation

/// A structured value providing information about when a certain organization
/// or person owned a certain product.
public class OwnershipInfo: StructuredValue {

    /// The organization or person from which the product was acquired.
    public var acquiredFrom: OrganizationOrPerson?

    /// The date and time of obtaining the product.
    public var ownedFrom: DateTime?

    /// The date and time of giving up ownership on the product.
    public var ownedThrough: DateTime?

    /// The product that this structured value is referring to.
    public var typeOfGood: ProductOrService?

    enum OwnershipInfoCodingKeys: String, CodingKey {
        case acquiredFrom
        case ownedFrom
        case ownedThrough
        case typeOfGood
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: OwnershipInfoCodingKeys.self)

        acquiredFrom = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .acquiredFrom)
        ownedFrom = try container.decodeIfPresent(DateTime.self, forKey: .ownedFrom)
        ownedThrough = try container.decodeIfPresent(DateTime.self, forKey: .ownedThrough)
        typeOfGood = try container.decodeIfPresent(ProductOrService.self, forKey: .typeOfGood)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: OwnershipInfoCodingKeys.self)

        try container.encodeIfPresent(acquiredFrom, forKey: .acquiredFrom)
        try container.encodeIfPresent(ownedFrom, forKey: .ownedFrom)
        try container.encodeIfPresent(ownedThrough, forKey: .ownedThrough)
        try container.encodeIfPresent(typeOfGood, forKey: .typeOfGood)

        try super.encode(to: encoder)
    }
}
