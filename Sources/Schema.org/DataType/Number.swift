import Foundation

public protocol NumberConformance:
                    Value,
                    NumberOrText
                {}

/// Integer (Int), Float
public protocol Number: NumberConformance {}

extension Int: Number {}

extension Float: Number {}
