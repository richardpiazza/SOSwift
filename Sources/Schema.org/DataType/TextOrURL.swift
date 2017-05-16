import Foundation

/// Text, URL
public protocol TextOrURL {}

public extension TextOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        }
        
        return nil
    }
}

extension String: TextOrURL {}

extension URL: TextOrURL {}
