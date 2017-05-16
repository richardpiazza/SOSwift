import Foundation

public protocol NumberConformance:
                    Value,
                    NumberOrText
                {}

/// Integer (Int), Float
public protocol Number: NumberConformance {}

public extension Number {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Int {
            return typedValue as AnyObject
        } else if let typedValue = self as? Float {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension Int: Number {}

extension Float: Number {}
