import Foundation

/// Product, Text, URL
public protocol ProductOrTextOrURL {}

public extension ProductOrTextOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Product {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? String {
            return typedValue as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}

extension String: ProductOrTextOrURL {}

extension URL: ProductOrTextOrURL {}
