import Foundation

/// CreativeWork, Product, URL
public protocol CreativeWorkOrProductOrURL {}

public extension CreativeWorkOrProductOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? CreativeWork {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Product {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}

extension URL: CreativeWorkOrProductOrURL {}
