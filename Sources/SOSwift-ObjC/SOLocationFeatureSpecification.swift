import Foundation
import SOSwiftVocabulary_ObjC

/// Specifies a location feature by providing a structured value representing a feature of an accommodation as a property-value pair of varying degrees of formality.
public class SOLocationFeatureSpecification: SOPropertyValue, LocationFeatureSpecification {
    
    public override class var type: String {
        return "LocationFeatureSpecification"
    }
    
    public override class var explicitSubtypes: [Thing.Type] {
        return []
    }
    
    /// The hours during which this service or contact is available.
    public var hoursAvailable: [OpeningHoursSpecification]?
    /// The date when the item becomes valid.
    public var validFrom: DateTime?
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    public var validThrough: DateTime?
    
    private enum CodingKeys: String, CodingKey {
        case hoursAvailable
        case validFrom
        case validThrough
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.hoursAvailable = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .hoursAvailable)
        self.validFrom = try container.decodeDateTimeIfPresent(forKey: .validFrom)
        self.validThrough = try container.decodeDateTimeIfPresent(forKey: .validThrough)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.hoursAvailable, forKey: .hoursAvailable)
        try container.encodeIfPresent(self.validFrom, forKey: .validFrom)
        try container.encodeIfPresent(self.validThrough, forKey: .validThrough)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: LocationFeatureSpecification?, forKey key: K) throws {
        if let typedValue = value as? SOLocationFeatureSpecification {
            try self.encode(typedValue, forKey: key)
        }
    }
}
