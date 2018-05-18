import Foundation
import SOSwiftVocabulary

extension AccessibilityHazard: AttributedEnum {
    public static var allCases: [AccessibilityHazard] {
        return [.flashing, .noFlashingHazard, .motionSimulation, .noMotionSimulation, .sound, .noSoundHazard, .unknown]
    }
    
    public var displayName: String {
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
