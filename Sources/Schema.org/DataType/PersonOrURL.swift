import Foundation

/// Person, URL
public protocol PersonOrURL {}

public extension PersonOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Person {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}

extension URL: PersonOrURL {}
