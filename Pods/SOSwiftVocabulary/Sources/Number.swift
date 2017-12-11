import Foundation

public protocol NumberConformance:
                    Value,
                    NumberOrText
                {}

/// Integer (Int), Float (Double)
public protocol Number: NumberConformance {}

extension Int: Number {}

extension Double: Number {}
