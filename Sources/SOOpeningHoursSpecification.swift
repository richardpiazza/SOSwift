import Foundation
import SOSwiftVocabulary

/// A structured value providing information about the opening hours of a place or a certain service inside a place.
/// The place is open if the opens property is specified, and closed otherwise.
/// If the value for the closes property is less than the value for the opens property then the hour range is assumed to span over the next day.
public class SOOpeningHoursSpecification: SOStructuredValue, OpeningHoursSpecification {
    
    public override class var type: String {
        return "OpeningHoursSpecification"
    }
    
    /// The closing hour of the place or service on the given day(s) of the week.
    public var closes: Time?
    /// The day of the week for which these opening hours are valid.
    public var dayOfWeek: DayOfWeek?
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .closes) {
            self.closes = value
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .dayOfWeek) {
            self.dayOfWeek = DayOfWeek(rawValue: value)
        }
        if let value = try container.decodeIfPresent(String.self, forKey: .opens) {
            self.opens = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .validFrom) {
            self.validFrom = value
        }
        if let value = try container.decodeDateTimeIfPresent(forKey: .validThrough) {
            self.validThrough = value
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.closes as? String {
            try container.encode(value, forKey: .closes)
        }
        if let value = self.dayOfWeek {
            try container.encode(value.rawValue, forKey: .dayOfWeek)
        }
        if let value = self.opens as? String {
            try container.encode(value, forKey: .opens)
        }
        try container.encodeIfPresent(self.validFrom, forKey: .validFrom)
        try container.encodeIfPresent(self.validThrough, forKey: .validThrough)
        
        try super.encode(to: encoder)
    }
}
