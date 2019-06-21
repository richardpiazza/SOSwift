import Foundation

/// Gender of the person.
/// While http://schema.org/Male and http://schema.org/Female may be used, text
/// strings are also acceptable for people who do not identify as a binary gender.
public enum Gender: String, CaseIterable, Codable {
    case female = "Female"
    case male = "Male"
    
    public var displayValue: String {
        switch self {
        case .female: return "Female"
        case .male: return "Male"
        }
    }
}
