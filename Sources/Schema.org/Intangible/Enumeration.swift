import Foundation

public protocol EnumerationConformance:
                    ValueReference
                {}

/// Lists or enumerations—for example, a list of cuisines or music genres, etc.
public protocol Enumeration: Intangible, EnumerationConformance {
    
}
