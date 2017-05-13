import Foundation

/// Indicates that the resource is compatible with the referenced accessibility API.
public enum AccessibilityAPI: String {
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
}
