import Foundation

/// MusicGroup, Person
public protocol MusicGroupOrPerson {}

public extension MusicGroupOrPerson {
    var dictionaryValue: AnyObject? {
        if let typedValue = self as? MusicGroup {
            return typedValue.dictionary as AnyObject
        } else if let typedValue = self as? Person {
            return typedValue.dictionary as AnyObject
        }
        
        return nil
    }
}
