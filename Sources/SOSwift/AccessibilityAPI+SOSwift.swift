import Foundation
import SOSwiftVocabulary

extension AccessibilityAPI: AttributedEnum {
    public static var allCases: [AccessibilityAPI] {
        return [.androidAccessibility, .aria, .atk, .atSPI, .blackberryAccessibility, .iAccessible2, .iOSAccessibility, .javaAccessibility, .macOSXAccessibility, .msaa, .uiAutomation]
    }
    
    public var displayName: String {
        switch self {
        case .androidAccessibility: return "Android Accessibility"
        case .aria: return "Accessible Rich Internet Applications"
        case .atk: return "GNOME Accessibility Toolkit"
        case .atSPI: return "Assistive Technology Service Provider Interface"
        case .blackberryAccessibility: return "Blackberry Accessibility"
        case .iAccessible2: return "Microsoft Windows Accesibility"
        case .iOSAccessibility: return "iOS Accessibility"
        case .javaAccessibility: return "Java Accessibility"
        case .macOSXAccessibility: return "Mac OS Accessibiliy"
        case .msaa: return "Microsoft Active Accessibility"
        case .uiAutomation: return "UI Automation"
        }
    }
}
