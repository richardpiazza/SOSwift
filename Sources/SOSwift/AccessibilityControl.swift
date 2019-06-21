import Foundation

/// Identifies one or more input methods that allow access to all of the
/// application functionality.
public enum AccessibilityControl: String, CaseIterable, Codable {
    case fullKeyboardControl = "fullKeyboardControl"
    case fullMouseControl = "fullMouseControl"
    case fullSwitchControl = "fullSwitchControl"
    case fullTouchControl = "fullTouchControl"
    case fullVideoControl = "fullVideoControl"
    case fullVoiceControl = "fullVoiceControl"
    
    public var displayValue: String {
        switch self {
        case .fullKeyboardControl: return "Full Keyboard Control"
        case .fullMouseControl: return "Full Mouse Control"
        case .fullSwitchControl: return "Full Switch Control"
        case .fullTouchControl: return "Full Touch Control"
        case .fullVideoControl: return "Full Video Control"
        case .fullVoiceControl: return "Full Voice Control"
        }
    }
}
