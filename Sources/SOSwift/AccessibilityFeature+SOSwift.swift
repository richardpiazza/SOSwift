import Foundation
import SOSwiftVocabulary

extension AccessibilityFeature: AttributedEnum {
    public static var allCases: [AccessibilityFeature] {
        return [
            .alternativeText, .annotations, .audioDescription, .bookmarks, .braille, .captions, .chemML,
            .describedMath, .displayTransformability, .highContrastAudio, .highContrastDisplay, .index, .largePrint,
            .latex, .longDescription, .mathML, .none, .printPageNumbers, .readingOrder, .rubyAnnotations, .signLanguage,
            .structuralNavigation, .synchronizedAudioText, .tableOfContents, .taggedPDF, .tactileGraphic,
            .tactileObject, .timingControl, .transcript, .ttsMarkup, .unlocked
        ]
    }
    
    public var displayName: String {
        switch self {
        case .alternativeText: return "Alternative Text"
        case .annotations: return "Annotations"
        case .audioDescription: return "Audio Description"
        case .bookmarks: return "Bookmarks"
        case .braille: return "Braille"
        case .captions: return "Captions"
        case .chemML: return "Chemical Markup Language"
        case .describedMath: return "Described Math"
        case .displayTransformability: return "Display Transformability"
        case .highContrastAudio: return "High Contrast Audio"
        case .highContrastDisplay: return "High Contrast Display"
        case .index: return "Index"
        case .largePrint: return "Large Print"
        case .latex: return "Lamport TeX"
        case .longDescription: return "Long Description"
        case .mathML: return "Math Markup Language"
        case .none: return "None"
        case .printPageNumbers: return "Print Page Numbers"
        case .readingOrder: return "Reading Order"
        case .rubyAnnotations: return "Ruby Annotations"
        case .signLanguage: return "Sign Language"
        case .structuralNavigation: return "Structural Navigation"
        case .synchronizedAudioText: return "Synchronized Audio Text"
        case .tableOfContents: return "Table Of Contents"
        case .taggedPDF: return "Tagged PDF"
        case .tactileGraphic: return "Tactile Graphic"
        case .tactileObject: return "Tactile Object"
        case .timingControl: return "Timing Control"
        case .transcript: return "Transcript"
        case .ttsMarkup: return "TTS Markup"
        case .unlocked: return "Unlocked"
        }
    }
}
