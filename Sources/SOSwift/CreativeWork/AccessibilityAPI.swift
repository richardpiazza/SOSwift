import Foundation

/// Indicates that the resource is compatible with the referenced accessibility API.
public enum AccessibilityAPI: String, CaseIterable, Codable {
    case androidAccessibility = "AndroidAccessibility"
    case aria = "ARIA"
    case atk = "ATK"
    case atSPI = "AT-SPI"
    case blackberryAccessibility = "BlackberryAccessibility"
    case iAccessible2
    case iOSAccessibility
    case javaAccessibility = "JavaAccessibility"
    case macOSXAccessibility = "MacOSXAccessibility"
    case msaa = "MSAA"
    case uiAutomation = "UIAutomation"

    public var displayValue: String {
        switch self {
        case .androidAccessibility: "Android Accessibility"
        case .aria: "Accessible Rich Internet Applications"
        case .atk: "GNOME Accessibility Toolkit"
        case .atSPI: "Assistive Technology Service Provider Interface"
        case .blackberryAccessibility: "Blackberry Accessibility"
        case .iAccessible2: "Microsoft Windows Accesibility"
        case .iOSAccessibility: "iOS Accessibility"
        case .javaAccessibility: "Java Accessibility"
        case .macOSXAccessibility: "Mac OS Accessibiliy"
        case .msaa: "Microsoft Active Accessibility"
        case .uiAutomation: "UI Automation"
        }
    }
}
