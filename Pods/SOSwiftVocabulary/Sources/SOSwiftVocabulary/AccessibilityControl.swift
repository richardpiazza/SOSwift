import Foundation

/// Identifies one or more input methods that allow access to all of the application functionality.
public enum AccessibilityControl: String {
    case fullKeyboardControl = "fullKeyboardControl"
    case fullMouseControl = "fullMouseControl"
    case fullSwitchControl = "fullSwitchControl"
    case fullTouchControl = "fullTouchControl"
    case fullVideoControl = "fullVideoControl"
    case fullVoiceControl = "fullVoiceControl"
}
