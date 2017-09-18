import Foundation
import SOSwiftVocabulary

/// A map.
public class SOMap: SOCreativeWork, Map {
    public struct Keys {
        public static let mapType = "mapType"
    }
    
    override public class var type: String {
        return "Map"
    }
    
    /// Indicates the kind of Map, from the MapCategoryType Enumeration.
    public var mapType: MapType?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.mapType] as? String {
            self.mapType = MapType(rawValue: value)
        }
    }
    
    public override var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.mapType {
            dictionary[Keys.mapType] = value.rawValue as AnyObject
        }
        return dictionary
    }
}
