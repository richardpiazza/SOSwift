import Foundation

/// An enumeration of several kinds of Map.
public enum MapType: String, CaseIterable, Codable {
    case parking = "ParkingMap"
    case seating = "SeatingMap"
    case transit = "TransitMap"
    case venue = "VanueMap"
    
    public var displayValue: String {
        switch self {
        case .parking: return "Parking"
        case .seating: return "Seating"
        case .transit: return "Transit"
        case .venue: return "Venue"
        }
    }
}
