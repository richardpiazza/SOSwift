import Foundation

/// A characteristic of the described resource that is physiologically dangerous to some users.
///
/// Related to WCAG 2.0 guideline 2.3.
///
/// * All three of the negative properties should be set if none of the hazards are known to exist.
/// * If the content has hazard(s), include positive assertions for the hazards it has and negative assertions for the
///     others.
/// * If the property is not set in the positive or negative or is specifically set to unknown, the state of hazards is
///     not known.
public enum AccessibilityHazard: String, CaseIterable, Codable {
    case flashing = "flashing"
    case noFlashingHazard = "noFlashingHazard"
    case motionSimulation = "motionSimulation"
    case noMotionSimulation = "noMotionSimulation"
    case sound = "sound"
    case noSoundHazard = "noSoundHazard"
    case unknown = "unknown"
    
    public var displayValue: String {
        switch self {
        case .flashing: return "Flashing"
        case .noFlashingHazard: return "No Flashing Hazard"
        case .motionSimulation: return "Motion Simulation"
        case .noMotionSimulation: return "No Motion Simulation"
        case .sound: return "Sound"
        case .noSoundHazard: return "No Sound Hazard"
        case .unknown: return "Unknown"
        }
    }
}
