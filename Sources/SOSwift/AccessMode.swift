import Foundation

/// The human sensory perceptual system or cognitive faculty through which a person may process or perceive information.
public enum AccessMode: String, CaseIterable, Codable {
    case auditory = "auditory"
    case tactile = "tactile"
    case textual = "textual"
    case visual = "visual"
    case colorDependent = "colorDependent"
    case chartOnVisual = "chartOnVisual"
    case chemOnVisual = "chemOnVisual"
    case diagramOnVisual = "diagramOnVisual"
    case mathOnVisual = "mathOnVisual"
    case musicOnVisual = "musicOnVisual"
    case textOnVisual = "textOnVisual"
    
    public var displayValue: String {
        switch self {
        case .auditory: return "Auditory"
        case .tactile: return "Tactile"
        case .textual: return "Textual"
        case .visual: return "Visual"
        case .colorDependent: return "Color Dependent"
        case .chartOnVisual: return "Chart-On-Visual"
        case .chemOnVisual: return "Chemical-On-Visual"
        case .diagramOnVisual: return "Diagram-On-Visual"
        case .mathOnVisual: return "Math-On-Visual"
        case .musicOnVisual: return "Music-On-Visual"
        case .textOnVisual: return "Text-On-Visual"
        }
    }
}
