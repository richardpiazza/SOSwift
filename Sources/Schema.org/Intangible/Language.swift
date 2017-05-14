import Foundation

public protocol LanguageConformance:
                    LanguageOrText
                {}

/// Natural languages such as Spanish, Tamil, Hindi, English, etc.
/// Formal language code tags expressed in BCP 47 can be used via the alternateName property.
/// The Language type previously also covered programming languages such as Scheme and Lisp, which are now best represented using ComputerLanguage.
public protocol Language: Intangible, LanguageConformance {
    
}
