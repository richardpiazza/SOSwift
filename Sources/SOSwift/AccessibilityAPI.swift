import Foundation

/// Indicates that the resource is compatible with the referenced accessibility API.
public enum AccessibilityAPI: String, CaseIterable, Codable {
    case androidAccessibility = "AndroidAccessibility"
    case aria = "ARIA"
    case atk = "ATK"
    case atSPI = "AT-SPI"
    case blackberryAccessibility = "BlackberryAccessibility"
    case iAccessible2 = "iAccessible2"
    case iOSAccessibility = "iOSAccessibility"
    case javaAccessibility = "JavaAccessibility"
    case macOSXAccessibility = "MacOSXAccessibility"
    case msaa = "MSAA"
    case uiAutomation = "UIAutomation"
    
    public var displayValue: String {
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
