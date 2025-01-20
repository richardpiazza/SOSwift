import Foundation

/// Specifies a location feature by providing a structured value representing a
/// feature of an accommodation as a property-value pair of varying degrees
/// of formality.
public class LocationFeatureSpecification: PropertyValue {

    /// The hours during which this service or contact is available.
    public var hoursAvailable: [OpeningHoursSpecification]?

    /// The date when the item becomes valid.
    public var validFrom: DateTime?

    /// The date after when the item is not valid. For example the end of an offer,
    /// salary period, or a period of opening hours.
    public var validThrough: DateTime?

    enum LocationFeatureSpecificationCodingKeys: String, CodingKey {
        case hoursAvailable
        case validFrom
        case validThrough
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: LocationFeatureSpecificationCodingKeys.self)

        hoursAvailable = try container.decodeIfPresent([OpeningHoursSpecification].self, forKey: .hoursAvailable)
        validFrom = try container.decodeIfPresent(DateTime.self, forKey: .validFrom)
        validThrough = try container.decodeIfPresent(DateTime.self, forKey: .validThrough)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: LocationFeatureSpecificationCodingKeys.self)

        try container.encodeIfPresent(hoursAvailable, forKey: .hoursAvailable)
        try container.encodeIfPresent(validFrom, forKey: .validFrom)
        try container.encodeIfPresent(validThrough, forKey: .validThrough)

        try super.encode(to: encoder)
    }
}
