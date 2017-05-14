import Foundation

public protocol LanguageConformance:
                    LanguageOrText
                {}

public protocol SchemaLanguage: Intangible, LanguageConformance {
    
}
