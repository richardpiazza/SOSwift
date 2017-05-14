import Foundation

public protocol DistanceConformance:
                    DistanceOrQuantitativeValue
                {}

public protocol Distance: Quantity, DistanceConformance {
    
}
