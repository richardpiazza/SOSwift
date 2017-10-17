import Foundation
import SOSwiftVocabulary

/// Specifies a location feature by providing a structured value representing a feature of an accommodation as a property-value pair of varying degrees of formality.
public class SOLocationFeatureSpecification: SOPropertyValue, LocationFeatureSpecification {
    
    override public class var type: String {
        return "LocationFeatureSpecification"
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent([SOOpeningHoursSpecification].self, forKey: .hoursAvailable) {
            self.hoursAvailable = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .validFrom) {
            self.validFrom = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .validThrough) {
            self.validThrough = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.hoursAvailable as? [SOOpeningHoursSpecification] {
            try container.encode(value, forKey: .hoursAvailable)
        }
        if let value = self.validFrom {
            try container.encodeDateTime(value, forKey: .validFrom)
        }
        if let value = self.validThrough {
            try container.encodeDateTime(value, forKey: .validThrough)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
