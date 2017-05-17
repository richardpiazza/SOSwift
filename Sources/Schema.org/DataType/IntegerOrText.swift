import Foundation

/// Integer (Int), Text
public protocol IntegerOrText {}

public extension IntegerOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Int {
            return typedValue as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension Int: IntegerOrText {}

extension String: IntegerOrText {}
