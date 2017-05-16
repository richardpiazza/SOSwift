import Foundation

/// CreativeWork, URL
public protocol CreativeWorkOrURL {}

public extension CreativeWorkOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? CreativeWork {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}

extension URL: CreativeWorkOrURL {}
