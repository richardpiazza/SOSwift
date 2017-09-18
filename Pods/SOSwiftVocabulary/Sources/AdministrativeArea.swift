import Foundation

public protocol AdministrativeAreaConformance:
                    AreaServed
                {}

/// A geographical region, typically under the jurisdiction of a particular government.
public protocol AdministrativeArea: Place, AdministrativeAreaConformance {
    
}
