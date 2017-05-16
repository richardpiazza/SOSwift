import Foundation

/// ImageObject, URL
public protocol ImageObjectOrURL {}

public extension ImageObjectOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? ImageObject {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}


extension URL: ImageObjectOrURL {}
