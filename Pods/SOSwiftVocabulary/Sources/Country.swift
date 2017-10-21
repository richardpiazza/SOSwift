import Foundation

public protocol CountryConformance:
                    CountryOrText
                {}

/// A country.
public protocol Country: AdministrativeArea, CountryConformance {
    
}
