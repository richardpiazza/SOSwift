import Foundation
import SOSwiftVocabulary

extension AccessMode: AttributedEnum {
    public static var allCases: [AccessMode] {
        return [.auditory, .tactile, .textual, .visual, .colorDependent, .chartOnVisual, .chemOnVisual, .diagramOnVisual, .mathOnVisual, .musicOnVisual, .textOnVisual]
    }
    
    public var displayName: String {
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
