import Foundation

public class WarrantyPromise: Thing {

    /// The duration of the warranty promise. Common unitCode values are ANN for
    /// year, MON for months, or DAY for days.
    public var durationOfWarranty: QuantitativeValue?

    /// The scope of the warranty promise.
    public var warrantyScope: WarrantyScope?

    enum WarrantyPromiseCodingKeys: String, CodingKey {
        case durationOfWarranty
        case warrantyScope
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: WarrantyPromiseCodingKeys.self)

        durationOfWarranty = try container.decodeIfPresent(QuantitativeValue.self, forKey: .durationOfWarranty)
        warrantyScope = try container.decodeIfPresent(WarrantyScope.self, forKey: .warrantyScope)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: WarrantyPromiseCodingKeys.self)

        try container.encodeIfPresent(durationOfWarranty, forKey: .durationOfWarranty)
        try container.encodeIfPresent(warrantyScope, forKey: .warrantyScope)

        try super.encode(to: encoder)
    }
}
