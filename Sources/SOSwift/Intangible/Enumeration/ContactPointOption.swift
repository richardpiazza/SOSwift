import Foundation

// Enumerated options related to a ContactPoint
public enum ContactPointOption: String, CaseIterable, Codable {
    case hearingImparedSupported = "HearingImparedSupported"
    case tollFree = "TollFree"

    public var displayValue: String {
        switch self {
        case .hearingImparedSupported: "Hearing Impared Supported"
        case .tollFree: "Toll Free"
        }
    }
}
