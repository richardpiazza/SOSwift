import Foundation

/// The human sensory perceptual system or cognitive faculty through which a person may process or perceive information.
public enum AccessMode: String, CaseIterable, Codable {
    case auditory
    case tactile
    case textual
    case visual
    case colorDependent
    case chartOnVisual
    case chemOnVisual
    case diagramOnVisual
    case mathOnVisual
    case musicOnVisual
    case textOnVisual

    public var displayValue: String {
        switch self {
        case .auditory: "Auditory"
        case .tactile: "Tactile"
        case .textual: "Textual"
        case .visual: "Visual"
        case .colorDependent: "Color Dependent"
        case .chartOnVisual: "Chart-On-Visual"
        case .chemOnVisual: "Chemical-On-Visual"
        case .diagramOnVisual: "Diagram-On-Visual"
        case .mathOnVisual: "Math-On-Visual"
        case .musicOnVisual: "Music-On-Visual"
        case .textOnVisual: "Text-On-Visual"
        }
    }
}
