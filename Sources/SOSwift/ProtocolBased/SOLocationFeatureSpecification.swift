import Foundation
import SOSwiftVocabulary

/// Specifies a location feature by providing a structured value representing a feature of an accommodation as a property-value pair of varying degrees of formality.
public class SOLocationFeatureSpecification: SOPropertyValue, LocationFeatureSpecification {
    
    public override class var type: String {
        return "LocationFeatureSpecification"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The hours during which this service or contact is available.
    public var hoursAvailable: [OpeningHoursSpecification]?
    /// The date when the item becomes valid.
    public var validFrom: SOSwiftVocabulary.DateTime?
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    public var validThrough: SOSwiftVocabulary.DateTime?
    
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
        
        try container.encodeIfPresent(self.hoursAvailable, forKey: .hoursAvailable)
        try container.encodeIfPresent(self.validFrom, forKey: .validFrom)
        try container.encodeIfPresent(self.validThrough, forKey: .validThrough)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.hoursAvailable.rawValue:
            return "The hours during which this service or contact is available."
        case CodingKeys.validFrom.rawValue:
            return "The date when the item becomes valid."
        case CodingKeys.validThrough.rawValue:
            return "The date after when the item is not valid."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.hoursAvailable.rawValue:
            self.hoursAvailable = value as? [OpeningHoursSpecification]
        case CodingKeys.validFrom.rawValue:
            self.validFrom = value as? SOSwiftVocabulary.DateTime
        case CodingKeys.validThrough.rawValue:
            self.validThrough = value as? SOSwiftVocabulary.DateTime
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: LocationFeatureSpecification?, forKey key: K) throws {
        if let typedValue = value as? SOLocationFeatureSpecification {
            try self.encode(typedValue, forKey: key)
        }
    }
}
