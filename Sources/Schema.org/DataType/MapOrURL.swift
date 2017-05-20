import Foundation

/// Map, URL
public protocol MapOrURL {}

public extension MapOrURL {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? Map {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? URL {
            return typedValue.absoluteString as AnyObject
        }
        
        return nil
    }
}

extension URL: MapOrURL {}
