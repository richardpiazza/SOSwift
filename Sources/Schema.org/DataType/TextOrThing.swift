import Foundation

/// Text, Thing
public protocol TextOrThing {}

public extension TextOrThing {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Thing {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: TextOrThing {}
