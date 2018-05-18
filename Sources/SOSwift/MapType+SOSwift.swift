import Foundation
import SOSwiftVocabulary

extension MapType: AttributedEnum {
    public static var allCases: [MapType] {
        return [.parking, .seating, .transit, .venue]
    }
    
    public var displayName: String {
        switch self {
        case .parking: return "Parking"
        case .seating: return "Seating"
        case .transit: return "Transit"
        case .venue: return "Venue"
        }
    }
}
