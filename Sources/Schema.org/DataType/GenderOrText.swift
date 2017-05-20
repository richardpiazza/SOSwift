import Foundation

/// Gender, Text
public protocol GenderOrText {}

public extension GenderOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Gender {
            return typedValue.rawValue as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: GenderOrText {}
