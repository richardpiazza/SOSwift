import Foundation

/// Content features of the resource, such as accessible media, supported enhancements for accessibility and
/// alternatives.
public enum AccessibilityFeature: String, CaseIterable, Codable {
    case alternativeText
    case annotations
    case audioDescription
    case bookmarks
    case braille
    case captions
    case chemML = "ChemML"
    case describedMath
    case displayTransformability
    case highContrastAudio
    case highContrastDisplay
    case index
    case largePrint
    case latex
    case longDescription
    case mathML = "MathML"
    case none
    case printPageNumbers
    case readingOrder
    case rubyAnnotations
    case signLanguage
    case structuralNavigation
    case synchronizedAudioText
    case tableOfContents
    case taggedPDF
    case tactileGraphic
    case tactileObject
    case timingControl
    case transcript
    case ttsMarkup
    case unlocked

    public var displayValue: String {
        switch self {
        case .alternativeText: "Alternative Text"
        case .annotations: "Annotations"
        case .audioDescription: "Audio Description"
        case .bookmarks: "Bookmarks"
        case .braille: "Braille"
        case .captions: "Captions"
        case .chemML: "Chemical Markup Language"
        case .describedMath: "Described Math"
        case .displayTransformability: "Display Transformability"
        case .highContrastAudio: "High Contrast Audio"
        case .highContrastDisplay: "High Contrast Display"
        case .index: "Index"
        case .largePrint: "Large Print"
        case .latex: "Lamport TeX"
        case .longDescription: "Long Description"
        case .mathML: "Math Markup Language"
        case .none: "None"
        case .printPageNumbers: "Print Page Numbers"
        case .readingOrder: "Reading Order"
        case .rubyAnnotations: "Ruby Annotations"
        case .signLanguage: "Sign Language"
        case .structuralNavigation: "Structural Navigation"
        case .synchronizedAudioText: "Synchronized Audio Text"
        case .tableOfContents: "Table Of Contents"
        case .taggedPDF: "Tagged PDF"
        case .tactileGraphic: "Tactile Graphic"
        case .tactileObject: "Tactile Object"
        case .timingControl: "Timing Control"
        case .transcript: "Transcript"
        case .ttsMarkup: "TTS Markup"
        case .unlocked: "Unlocked"
        }
    }
}
