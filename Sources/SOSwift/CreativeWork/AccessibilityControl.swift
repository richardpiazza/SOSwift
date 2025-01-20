import Foundation

/// Identifies one or more input methods that allow access to all of the application functionality.
public enum AccessibilityControl: String, CaseIterable, Codable {
    case fullKeyboardControl
    case fullMouseControl
    case fullSwitchControl
    case fullTouchControl
    case fullVideoControl
    case fullVoiceControl

    public var displayValue: String {
        switch self {
        case .fullKeyboardControl: "Full Keyboard Control"
        case .fullMouseControl: "Full Mouse Control"
        case .fullSwitchControl: "Full Switch Control"
        case .fullTouchControl: "Full Touch Control"
        case .fullVideoControl: "Full Video Control"
        case .fullVoiceControl: "Full Voice Control"
        }
    }
}
