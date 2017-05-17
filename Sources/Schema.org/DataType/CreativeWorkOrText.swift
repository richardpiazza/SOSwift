import Foundation

/// CreativeWork, Text
public protocol CreativeWorkOrText {}

public extension CreativeWorkOrText {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? CreativeWork {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: CreativeWorkOrText {}
