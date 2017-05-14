import Foundation

public protocol LanguageConformance:
                    LanguageOrText
                {}

public protocol Language: Intangible, LanguageConformance {
    
}
