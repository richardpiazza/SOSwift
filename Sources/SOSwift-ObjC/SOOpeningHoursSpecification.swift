import Foundation
import SOSwiftVocabulary_ObjC

/// A structured value providing information about the opening hours of a place or a certain service inside a place.
/// The place is open if the opens property is specified, and closed otherwise.
/// If the value for the closes property is less than the value for the opens property then the hour range is assumed to span over the next day.
public class SOOpeningHoursSpecification: SOStructuredValue, OpeningHoursSpecification {
    
    public override class var type: String {
        return "OpeningHoursSpecification"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The closing hour of the place or service on the given day(s) of the week.
    public var closes: Time?
    /// The day of the week for which these opening hours are valid.
    public var dayOfWeekRawValue: NSNumber?
    /// The opening hour of the place or service on the given day(s) of the week.
    public var opens: Time?
    /// The date when the item becomes valid.
    public var validFrom: DateTime?
    /// The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.
    public var validThrough: DateTime?
    
    private enum CodingKeys: String, CodingKey {
        case closes
        case dayOfWeek
        case opens
        case validFrom
        case validThrough
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .closes) {
            self.closes = value as NSString
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .dayOfWeek) {
            self.dayOfWeek = DayOfWeek(stringValue: value)
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .opens) {
            self.opens = value as NSString
        }
        self.validFrom = try container.decodeDateTimeIfPresent(forKey: .validFrom)
        self.validThrough = try container.decodeDateTimeIfPresent(forKey: .validThrough)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.closes, forKey: .closes)
        try container.encodeIfPresent(self.dayOfWeek?.stringValue, forKey: .dayOfWeek)
        try container.encodeIfPresent(self.opens, forKey: .opens)
        try container.encodeIfPresent(self.validFrom, forKey: .validFrom)
        try container.encodeIfPresent(self.validThrough, forKey: .validThrough)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: OpeningHoursSpecification?, forKey key: K) throws {
        if let typedValue = value as? SOOpeningHoursSpecification {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ value: [OpeningHoursSpecification]?, forKey key: K) throws {
        if let typedValue = value as? [SOOpeningHoursSpecification] {
            try self.encode(typedValue, forKey: key)
        }
    }
}
