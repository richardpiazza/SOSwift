import Foundation

/// An enumeration of several kinds of Map.
public enum MapType: String, CaseIterable, Codable {
    case parking = "ParkingMap"
    case seating = "SeatingMap"
    case transit = "TransitMap"
    case venue = "VenueMap"

    public var displayValue: String {
        switch self {
        case .parking: "Parking"
        case .seating: "Seating"
        case .transit: "Transit"
        case .venue: "Venue"
        }
    }
}
