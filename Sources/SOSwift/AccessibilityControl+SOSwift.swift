import Foundation
import SOSwiftVocabulary

extension AccessibilityControl: AttributedEnum {
    public static var allCases: [AccessibilityControl] {
        return [.fullKeyboardControl, .fullMouseControl, .fullSwitchControl, .fullTouchControl, .fullVideoControl, .fullVoiceControl]
    }
    
    public var displayName: String {
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
